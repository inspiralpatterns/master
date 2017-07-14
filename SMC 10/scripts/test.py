import numpy as np
from keras.layers import Input, Dense, Conv2D, MaxPooling2D, UpSampling2D
from keras.models import Model
from keras import backend as K
from keras import regularizers

# if using LeakyReLU
from keras.layers.advanced_activations import LeakyReLU


# definition of the sparsity penalty
# the KL divergence describe the penalty term to be applied to the loss function
def KL(p, p_hat):
    return (p * K.log(p / p_hat)) + ((1-p) * K.log((1-p) / (1-p_hat)))

class SparseReg(regularizers.Regularizer):

    def __init__(self, p=0.05, beta=0.1,p_hat=0.0):
        self.p = K.cast_to_floatx(p)
        self.beta = K.cast_to_floatx(beta)
        self.p_hat = K.cast_to_floatx(p_hat)

    def __call__(self, x):
        regularization = 0.
        # p_hat needs to be the average activation of the units in the hidden layer.
        self.p_hat = K.sum(K.mean(x))

        regularization += self.beta * KL(self.p,self.p_hat)
        return regularization

    def get_config(self):
        return {'p': float(self.p),
                'beta': float(self.beta)
               }


# DATA LOADING AND INITIALISATION
# load the dataset
dataset = np.load('dataset_test.npz','r')
data = dataset['spectrograms']
print('Dataset with shape', data.shape)

# reshape the dataset in 4-dimension tensor
data = np.reshape(data, (data.shape[0], data.shape[1], data.shape[2], 1))
print('Dataset reshaping in tensor of shape', data.shape)

# split between train and validation set
train_set = data[:1500]
validation_set = data[1500:]
print('Train batch:',train_set.shape)
print('Validation batch:',validation_set.shape)


# ARCHITECTURE DEFINITION
# input structure
input_img = Input(shape=(28,28,1))  
print('Input tensor shape:', input_img.shape)

# encoding structure
x = Conv2D(256, (3, 3), activation='relu', padding='same', 
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay1')(input_img)
x = MaxPooling2D(pool_size=(2,2), strides=(2), padding='same')(x)
x = Conv2D(256, (3, 3), activation='relu', padding='same', 
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay2')(x)
x = MaxPooling2D(pool_size=(2,2), strides=(2), padding='same')(x)
x = Conv2D(512, (3, 3), activation='relu', padding='same', 
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay3')(x)
x = Conv2D(1024, (1, 1), activation='relu', padding='same', 
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay3bis')(x)
encoded = MaxPooling2D(pool_size=(2,2), strides=(2), padding='same')(x)
print('Encoded representation tensor shape:', encoded.shape)

# decoding structure
x = Conv2D(1024, (1, 1), activation='relu', padding='same',
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay4')(encoded)
x = Conv2D(512, (3, 3), activation='relu', padding='same', 
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay4bis')(x)
x = UpSampling2D(size=(2,2))(x)
x = Conv2D(256, (3, 3), activation='relu', padding='same', 
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay5')(x)
x = UpSampling2D(size=(2,2))(x)
x = Conv2D(256, (3, 3), activation='relu',
           activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay6')(x)
x = UpSampling2D(size=(2,2))(x)
decoded = Conv2D(1, (5, 5), activation='relu', padding='same', 
                 activity_regularizer=SparseReg(beta=5e-1,p=1e-2),name='lay7')(x)
print('Decoded representation tensor shape:', decoded.shape)


# compile the model
autoencoder = Model(input_img, decoded)
autoencoder.compile(optimizer='adam', loss='mse')

# IF USING MNIST
from keras.datasets import mnist
import numpy as np

(x_train, _), (x_test, _) = mnist.load_data()

x_train = x_train.astype('float32') / 255.
x_test = x_test.astype('float32') / 255.
x_train = np.reshape(x_train, (len(x_train), 28, 28, 1))  # adapt this if using `channels_first` image data format
x_test = np.reshape(x_test, (len(x_test), 28, 28, 1))  # adapt this if using `channels_first` image data format


# add noise to the data to force the autoencoder not to learn the identity function
noise_factor = 0.1
train_set_noisy = train_set + noise_factor * np.random.normal(loc=0.0, scale=1.0, size=train_set.shape) 
validation_set_noisy = validation_set + noise_factor * np.random.normal(loc=0.0, scale=1.0, size=validation_set.shape) 

train_set_noisy = np.clip(train_set_noisy, 0., 1.)
validation_set_noisy = np.clip(validation_set_noisy, 0., 1.)


# MODEL TRAINING
# obs: do not use noise injection with spectrograms
autoencoder.fit(x_train, x_train,
                epochs=10,
                batch_size=128,
		shuffle=True,
		validation_data=(x_test, x_test),
                )


import h5py
autoencoder.save('spectrogram_dataset.h5')
