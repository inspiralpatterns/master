%% MSPR lecture 11, 09/XI/15
%% FEATURE SELECTION

prpath = '/Librerie/prtools';
addpath(prpath);
load featevalsets.mat

w = ldc(Ztr)
pred_lab = labeld(Ztst,w)
confmat(labtst,pred_lab)
accuracy = sum(pred_lab==labtst)/18

%% using Support Vector Machine

for classi = 1:2
    if classi == 1
        w = ldc(Ztr);
    else
        w = svc(Ztr,'r');
    end
    pred_lab = labeld(Ztst,w)
    confmat(labtst,pred_lab)
    accuracy = sum(pred_lab==labtst)/18
    pause
end

%% Feature reduction

% long way 
S = cov(Xtr);
[V,D] = eig(S);
[eigv,idx] = sort(diag(D),'descend');
Eigv = V(:,idx);
Xc = Xtr-ones(18,1)*mean(Xtr);
Xs = Xc*Eigv(:,1:2);

% short way using PRTools
[pca_map,cumper] = pcam(Ztr,2); % principal component analysis

Zred = Ztr*pca_map; % reduction on train data
Ztstred = Ztst*pca_map; % reduction on test data

Wldc = ldc(Zred); % classifier training
% application on LDC classifier
pred_lab = labeld(Ztstred,Wldc)
confmat(labtst,pred_lab)

% application on SVC classifier
for classi = 1:2
    if classi == 1
        w = ldc(Zred);
    else
        w = svc(Zred,'r');
    end
    pred_lab = labeld(Ztstred,w)
    confmat(labtst,pred_lab)
    
    pause
end

%plot the result of classification
scatterd(Ztstred,pred_lab);


%% Filter method of feature selection
% (use correlation between features and labels)

J = size(Xtr,2); % get the number of features

% calculate correlation coefficients for each feature
for j=1:J
    [r,p] = corrcoef(Xtr(:,j),labtr);
    R(j) = r(1,2);
    P(j) = p(1,2);
end

% sort R and get the two highest feature values
[dummy, rrank] = sort(R, 'descend');
selfeat = rrank(1:2);
% plot the result of classification
scatterd(Ztr(:,selfeat));



%% Forward selection and wrapper

for classi = 1:2
    if classi == 1
        w = ldc([]);
    else
        w = svc([],'r');
    end
    FEAT_MAP = featselm(Ztr,w,'forward',2,Zval);
    J =  FEAT_MAP.data{1};
    if classi == 1
        w = ldc(Ztr*FEAT_MAP);
    else
        w = svc(Ztr*FEAT_MAP,'r');
    end
    
    res = labeld(Ztst*FEAT_MAP,w);
    confmat(labtst,res)
    
    pause
end

%% REGRESSION

load bow.mat
% calculate regression coefficients
w = mvregress(x,y,'algorithm','cwls')

% calculate the intercept w0
ymean = mean(y)
xmean = mean(x)
w0 = ymean - w'*xmean'

% calculate multivariate regression
f = w0 + w'*x';
error = sqrt(mean(f-y').^2);

% univariate regression using only the third compoment






