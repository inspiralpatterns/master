# -*- coding: utf-8 -*-
"""
name:           soundtypes_ae.py
author:         mattia paterna
created:        April, 8 2017
last edit:
purpose:        implementation of a deep unsupervised structure using different types of autoencoder
"""

import numpy as np
from keras.layers import Input # define the input shape for the model
from keras.layers import Conv2D, MaxPooling2D, UpSampling2D # for the convnet structure
from keras.models import Model # for the overall definition

import matplotlib.pyplot as plt
import librosa
import librosa.display


# function to compute the spectrogram (it should not be here at the end)
def compute_specs(audiofile, no_mels, fft_size, hop_size, duration):
    [y, sr] = librosa.core.load(audiofile, sr=None, mono=True)

    # get audio file for desired duration
    len = sr * duration
    y = y[0:len]

    # get options for computing spectrogram
    mels = no_mels                      # frequency resolution
    fft = fft_size                      # fft length
    hop = hop_size                      # hop size

    # Mel spectrogram for the file, overlap=50%
    S = librosa.feature.melspectrogram(y, sr, n_fft=fft, n_mels=mels, hop_length=hop)
    # log-compressed version
    S = librosa.power_to_db(S, ref=np.max)

    # get spectrogram matrix dimensions (to be used in the convnet)
    dims = S.shape

    # plot the spectrogram
    """
    fig = plt.figure(figsize=[12, 4])
    librosa.display.specshow(S, sr=sr, y_axis='mel', x_axis='time')
    plt.colorbar(format='%+2.0f dB')
    plt.title('Mel spectrogram')
    plt.tight_layout()
    plt.show()
    fig.savefig('Original Mel spectrogram')
    """
    return S, dims


# DEEP LEARNING PART
# general parameters
INPUT_FILE = 'samples/Jarrett_Vienna_cut.wav'           # input file for feature evaluation
SR = 44100                                              # sampling rate
NO_MELS = 128                                           # no. of mel bins
FFT_SIZE = 1024                                         # size of FFT
HOP_SIZE = 512                                          # hop size (overlap)
DURATION = 30                                           # segment duration (sec)


# load the training dataset
# (obs: incomplete version)
dataset = np.load('dataset_test.npz','r')
data_training = dataset['dataset']
data_training = np.transpose(data_training)
print('Training dataset with shape', data_training.shape)
print('Batch size:', data_training.shape[0])


# Convolutional autoencoder structure using the Keras Model API
# define input shape
input_img = Input(shape=(2584,128,1))
print('Some information about tensor expected shapes')
print('Input tensor shape:', input_img.shape)

# define encoder convnet
x = Conv2D(filters=128,kernel_size=(4,4),activation='relu',padding='same')(input_img)
x = MaxPooling2D(pool_size=(2,2),strides=(2),padding='same')(x)
x = Conv2D(filters=256,kernel_size=(4,4),activation='relu',padding='same')(x)
x = MaxPooling2D(pool_size=(2,2),strides=(2),padding='same')(x)
x = Conv2D(filters=512,kernel_size=(4,4),activation='relu',padding='same')(x)
encoded = MaxPooling2D(pool_size=(2,2),strides=(2),padding='same')(x)
print('Encoded representation tensor shape:', encoded.shape)

# define decoder convnet
x = Conv2D(filters=512,kernel_size=(4,4),activation='relu',padding='same')(encoded)
x = UpSampling2D(size=(2,2))(x)
x = Conv2D(filters=256,kernel_size=(4,4),activation='relu',padding='same')(x)
x = UpSampling2D(size=(2,2))(x)
x = Conv2D(filters=128,kernel_size=(4,4),activation='relu',padding='same')(x)
x = UpSampling2D(size=(2,2))(x)
decoded = Conv2D(filters=1,kernel_size=(4,4),activation='linear',padding='same')(x)
print('Decoded representation tensor shape:', decoded.shape)

# define overal autoencoder model
cae = Model(inputs=input_img, outputs=decoded)
cae.compile(optimizer='adam', loss='mse')

# check for equal size
# obs: the missing value is the batch_size
if input_img.shape[1:] != decoded.shape[1:]: print('alert: in/out dimension mismatch')


# reshape the training set in 4-dimension tensor
data_training = np.reshape(data_training, (len(data_training), data_training.shape[1], data_training.shape[2], 1))
print('Data training reshaping in tensor of shape', data_training.shape)


# Autoencoder training
cae.fit(data_training,data_training,
        epochs=1,
        batch_size=4, # minibatch of 4 for memory optimisation
        #callbacks=[TensorBoard(log_dir='/tmp/autoencoder')]
       )


# Reconstruction test and image saving
[S, dims] = compute_specs(
            audiofile=INPUT_FILE,
            no_mels=NO_MELS,
            fft_size=FFT_SIZE,
            hop_size=HOP_SIZE,
            duration=DURATION,
        )

# create a test spectrogram
data_test = S.transpose()
data_test = np.reshape(S,newshape=(1, data_test.shape[0], data_test.shape[1], 1))
print('Test spectogram of shape', data_test.shape)
# spectrogram prediction
decoded_img = cae.predict(data_test)
print('Decoded image dimensions:', decoded_img.shape)

# reshape decoded_img in a 2D spectrogram
decoded_img = np.reshape(decoded_img,newshape=(2584,128))
decoded_img = decoded_img.transpose()
print('Decoded image after reshaping:',decoded_img.shape)


# display reconstruction
fig = plt.figure(figsize=[12, 4])
librosa.display.specshow(decoded_img, sr=SR, y_axis='mel', x_axis='time')
plt.colorbar(format='%+2.0f dB')
plt.title('Reconstructed Mel spectrogram')
plt.tight_layout()
plt.show()

# to save the image
fig.savefig('reconstruction.png')
print('Image saved.')
