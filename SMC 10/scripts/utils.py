# -*- coding: utf-8 -*-
"""
name:           utils.py
author:         mattia paterna
created:        march, 16 2017
last edit:      march, 21 2017
purpose:        contains utilities for feature learning using deep architectures
"""

# import needed modules
import numpy as np                      # general computation
import librosa                          # audio signal processing, feature extraction
from librosa import display             # plot the spectrogram
import matplotlib.pyplot as plt         # general plotting
import tensorflow as tf                 # neural networks

# - Feature Extraction -
# this function computes the spectrogram over 10 secs of a file
# and return the spectrogram S as matrix and its dimensions
def compute_spectrogram(audiofile, no_mels, fft_size, hop_size, duration):
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

    plt.figure(figsize=[12, 4])
    librosa.display.specshow(S, sr=sr, y_axis='mel', x_axis='time')
    plt.colorbar(format='%+2.0f dB')
    plt.title('Mel spectrogram')
    plt.tight_layout()
    plt.show()


    return S, dims


# - Feature learning using deep architectures -
# initialise weights and biases for the convnet
# (slightly positive to avoid dead neurons at the start)
def weight(shape):
    init = tf.truncated_normal(shape, stddev=0.1)
    return tf.Variable(init)


def bias(shape):
    init = tf.constant(0.1, shape=shape)
    return tf.Variable(init)


# define convolution and pooling operations
# (still in 2D, should be in 1D)
def conv(x, w):
    stride = 1                          # fixed stride all over the layers
    return tf.nn.conv2d(
        input=x,
        filter=w,
        strides=[1, stride, stride, 1],
        padding='SAME'
    )

def max_pool(x, pool_size, pool_stride):
    return tf.nn.max_pool(
        x,
        ksize=[1, 128, pool_size, 1],   # the kernel spans across time
        strides=[1, 128, pool_stride, 1],
        padding='SAME')


# this function build the graph for the convolutional neural network
# that is used for feature learning from the input spectrogram
def convnet(x, dims):
    # First convolutional layer
    w_conv1 = weight([dims[0], 6, 1, 256])  # the filter patch should be 128 * 6
    b_conv1 = bias([1])

    # reshape the input in a 4D tensor (required by conv2d)
    x_ = tf.reshape(x, [1, dims[0], dims[1], 1])
    print('First convolutional layer\n')
    print('Input dimensions:', x_.get_shape().as_list())

    h_conv1 = tf.nn.relu(conv(x_, w_conv1) + b_conv1)
    h_pool1 = max_pool(h_conv1, 4, 4)

    # Second convolutional layer
    w_conv2 = weight([dims[0], 6, 256, 256])
    b_conv2 = bias([1])

    h_conv2 = tf.nn.relu(conv(h_pool1, w_conv2) + b_conv2)
    h_pool2 = max_pool(h_conv2, 2, 2)

    # Third convolutional layer

    w_conv3 = weight([dims[0], 6, 256, 512])
    b_conv3 = bias([1])

    h_conv3 = tf.nn.relu(conv(h_pool2, w_conv3) + b_conv3)

    # Global temporal pooling
    # This layer computes statistics pooling across the entire time axis using 2 different functions.
    h_pool3_max = tf.nn.max_pool(h_conv3, ksize=[1, 1, 108, 1], strides=[1, 1, 108, 1], padding='SAME')
    h_pool3_mean = tf.nn.avg_pool(h_conv3, ksize=[1, 1, 108, 1], strides=[1, 1, 108, 1], padding='SAME')

    # stack the two pooling layers and reshape
    h_poolMain = tf.concat([h_pool3_max, h_pool3_mean], axis=1)
    h_poolMain = tf.reshape(h_poolMain, [-1, 2 * 512])

    # Densely connected layers
    # Layer no. 1
    w_fc1 = weight([1024, 2048])
    b_fc1 = bias([2048])
    h_fc1 = tf.nn.relu(tf.matmul(h_poolMain, w_fc1) + b_fc1)

    # Layer no. 2
    w_fc2 = weight([2048, 2048])
    b_fc2 = bias([2048])
    h_fc2 = tf.nn.relu(tf.matmul(h_fc1, w_fc2) + b_fc2)

    # Dropout stage before the readout layer
    dropout_prob = tf.placeholder(tf.float32)
    h_fc2_drop = tf.nn.dropout(h_fc2, dropout_prob)

    # Readout layer
    # This is the final fully-connected layer with the softmax to create a vector of probabilities
    w_out = weight([2048, 10])
    b_out = bias([10])

    y = tf.matmul(h_fc2_drop, w_out) + b_out

    return y

