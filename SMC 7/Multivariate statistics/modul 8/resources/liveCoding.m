%% MSPR lecture VIII, 19/X/2015
%% Convolutional neural networks
%% Assignment
MNISTpath='MNIST'

[I,labels,I_test,true_labs] = readMNIST(2);
imgdisplay = abs(double(I_test{2})/255-1)';
imagesc(reshape(imgdisplay,28,28));
colormap([0:1/255:1;0:1/255:1;0:1/255:1]');

%% Convolution
[x,fs] = audioread('Elvis.wav');
f = 108;
A = 0.3;
S = round(fs/f)*4;
T = 0:1/fs:1/(fs/S);
sine = A*sin(2*pi*f*T);

output = conv(x,sine); %convolution function
figure; plot(sine, 'b'); hold on;
plot(output, 'r');

%% Image convolution
[I,labels,I_test,true_labs] = readMNIST(2);
A = abs(double(I_test{2})/255-1)';
B = [0,0,0,0;0,0,0,0;1,1,1,1;1,1,1,1];
imgdisplay = abs(double(Z)/255-1);
colormap([0:1/255:1;0:1/255:1;0:1/255:1]');
Z = conv2(A,B); %convolution in two-dimension
imagesc(Z);

%% Artificial neural networks
x = [2,1,0];
w = [2,1];
b = 1;
ww = [1,0];
bb = 0;

xx(1) = 1/(1+exp(-(b+x(1:2)*w')));
xx(2) = 1/(1+exp(-(b+x(2:3)*w')));
xxx= 1/(1+exp(-(bb+xx*ww')))

%% Deep learning
load cnet.mat
[I,labels,I_test,true_labs] = readMNIST(2);
pre_im = preproc_image(I_test{1});
[out cnet] = sim(sinet,pre_im');
[dumm mxidx] = max(out)
res = mxidx-1
true_labs(1) %true lab and predicted lab are coincident







