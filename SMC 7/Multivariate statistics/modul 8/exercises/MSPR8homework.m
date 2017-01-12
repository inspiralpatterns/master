%%MSPR8 homework
%% Exercise 2

load cnet.mat
[I,labels,I_test,true_labs] = readMNIST(100);

for n=1:100
    im=preproc_image(I_test{n});
    [out,cnet]=sim(sinet,im');
    [dumm max_idx]=max(out);
    pred_lab(n,1)=max_idx-1;
end

prpath='/Librerie/prtools';
addpath(prpath);
cmat= confmat(double(true_labs),pred_lab);
confmat(double(true_labs),pred_lab)
wrong=find(true_labs~=pred_lab);
accuracy=sum(diag(cmat))/sum(sum(cmat));
fprintf('Accuracy: %d\n', accuracy);

for i=1:length(wrong)
    pred_lab(wrong(i));
    figure(i);
    imgdisplay = abs(double(I_test{wrong(i)})/255-1)';
    imagesc(reshape(imgdisplay,28,28));
    colormap([0:1/255:1;0:1/255:1;0:1/255:1]');
    fprintf('Predicted label:%d instead of %d\n',...
        pred_lab(wrong(i)),true_labs(wrong(i)));
end

%DISCUSSION
%The accuracy value of 97% reflects the overall number of right prediction
%versus the incorrect ones. Speculating over the misclassificated images,
%we can convey how this convolutional neural network tends to get confused
%between 3,9 and 7. For instance, in case the 9 digit presents a slope, it
%could be erroneously as a 7. It seems less reasonable the
%misclassification for the first error (6 instead of 4).

%% Exercise 3

[I,labels,I_test,labels_test] = readMNIST(100); 

%Structure reduction
numLayers = 5; 
numSLayers = 2; 
numCLayers = 2; 
numFLayers = 1;
numOutputs = 5; 
my_cnet = cnn(numLayers,numFLayers,1,32,32,numOutputs);

%Redefining networks parameters
%first layer: subsampling
my_cnet.SLayer{1}.SRate = 1;
my_cnet.SLayer{1}.WS{1} = ones(size(my_cnet.SLayer{1}.WS{1}));
my_cnet.SLayer{1}.BS{1} = zeros(size(my_cnet.SLayer{1}.BS{1}));
my_cnet.SLayer{1}.TransfFunc = 'purelin';
%second layer: convolutional
my_cnet.CLayer{2}.numKernels = 4;
my_cnet.CLayer{2}.KernWidth = 3;
my_cnet.CLayer{2}.KernHeight = 3;
%third layer: subsampling
my_cnet.SLayer{3}.SRate = 2;
%fourth layer:convolutional
my_cnet.CLayer{4}.numKernels = 12;
my_cnet.CLayer{4}.KernWidth = 4;
my_cnet.CLayer{4}.KernHeight = 4;
%fifth layer: fully
sinet.FLayer{8}.numNeurons = numOutputs;

sinet.epochs = 1;
sinet.mu = 0.001;
sinet.teta =  0.0005;
sinet.HcalcMode = 0;    
sinet.Hrecalc = 30; 
sinet.HrecalcSamplesNum = 10;
sinet.teta_dec = 0.4;

for n=1:100
    im = preproc_image(I_test{n});
    [out,cnet] = sim(my_cnet,im');
    [dumm,max_idx] = max(out);
    pred_lab(n,1) = max_idx-1;
end

%?
%Error in cnn/sim (line 45)
%for m=find(cnet.CLayer{k}.ConMap(l,:)) 


prpath = '/Librerie/prtools';
addpath(prpath);
confmat(double(true_labs),pred_lab)
