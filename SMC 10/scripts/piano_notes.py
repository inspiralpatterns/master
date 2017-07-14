'''
name:           piano_notes.py
author:         mattia paterna
date:           May, 18th
purpose:        create log-magnitude spectra from AIFF sample
                of single acoustic instruments notes
'''


# module for sound manipulation
import soundfile as sf
import librosa as librosa

import numpy as np

# module for folder inspection
import os
from os import listdir
from os.path import isfile, join

# inspect a specific folder with all the instrument samples
# and get a complete list of them
mypath = 'Piano/'
filenames = [f for f in listdir(mypath) if isfile(join(mypath, f))]


# define a function to process audio information

# define function for computing log magnitude spectra
def compute_spectra(x, fft_size, hop_size):

    # get options for computing spectra
    no_fft = fft_size                      # fft length
    hop = hop_size                         # hop size

    # STFT for the vector
    # (S is a complex matrix with the magnitude and phase of the fourier transform)
    S = librosa.core.stft(y=x,n_fft=no_fft,hop_length=hop_size)

    # get magnitude and phase information from the STFT
    phase = np.imag(S)
    # Take the magnitude with abs (call it Z) and return log(1 + Z) as the spectrogram
    mag = np.log1p(np.abs(S))

    return mag, phase


# define function for sum-to-mono
def process_audio(x):

    # sum to mono if audio has two channels
    # obs: when reading using sf, no. of channels is the first dimension
    if x.shape[1] is 2:
        y = librosa.core.to_mono(y=np.transpose(x))

    return y

# iterate the spectra computation over the directory list

# general parameters
fft_size = 1024                                         # size of FFT
hop_size = 512                                          # hop size (overlap)
timesteps = 2048                                        # frames in STFT
res = int(fft_size/2+1)                                 # frequency bin resolution of FFT

# obs: zero-pad may be necessary for shorter spectra
mags = np.empty([0, res, timesteps])                   
phases = np.empty([0, res, timesteps])


# iteration over the files
for filename in filenames:
    if filename.find('aiff') == -1:
        pass
    else:
        # get the dynamic range and the pitch
        # (obs: only for Iowa Uni samples)
        tokens = filename.split('.')
        dynamic = tokens[1]
        pitch = tokens[2]

        fullpath = mypath + filename

        # open and read the AIFF file
        y, sr = sf.read(fullpath)

        # sum to mono and resample
        y = process_audio(y)

        # spectra computation
        mag, phase = compute_spectra(x=y, fft_size=fft_size, hop_size=hop_size)
        if mag.shape[1] > 2048:
            # discard information about note tail
            mag = mag[:,:2048]
            phase = phase[:,:2048]
                

        if mag.shape[1] < 2048:
            # zero-pad the log-magnitude spectra
            mag = np.concatenate((mag, np.zeros((res,timesteps-mag.shape[1]))),axis=1)
            phase = np.concatenate((phase, np.zeros((res,timesteps-phase.shape[1]))),axis=1)
            # reshape spectrum


        mag = np.reshape(mag, newshape=[1, 513, 2048])
        phase = np.reshape(phase, newshape=[1, 513, 2048])
        # concatenate spectra in the dataset tensor
        mags = np.concatenate((mags, mag), axis=0)
        phases = np.concatenate((phases, mag), axis=0)
        print(filename, 'done')
        
                        

# dataset storage
print('Dataset shape:',dataset.shape)
# save the dataset
np.savez_compressed(file='piano_notes_dataset',
                    notes_mags=mags.astype(np.float32),
		    notes_phases=phases.astype(np.float32)
                   )
