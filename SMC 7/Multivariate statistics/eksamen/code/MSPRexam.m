%% MSPR exam dataset analysis
% Dataset: wine
% (http://archive.ics.uci.edu/ml/machine-learning-databases/wine/)

%%
%% 0. PRELIMINARY
% This dataset is divided into 3 different cultivars group

% Possible classification suggestion
% a. do wines differ when deriving from different cultivars?
% b. is there any correlation between any features?
% c. is it possible to trace any differences whithin each cultivar?
% d. are there any features that describe properly each class, and 
% which is the best one?
clear all;
close all;

%%
%% 1. IMPORT DATA
% (no categorical variables to convert into numerical ones)

fid = fopen('wine.data.txt');
data = textscan(fid, '%f%f%f%f%f%f%f%f%f%f%f%f%f%f',...
    'delimiter', ',');
fclose(fid);

% convert into a data matrix
X = [data{2} data{3} data{4} data{5} data{6} data{7} data{8} data{9}...
    data{10} data{11} data{12} data{13} data{14}];
% check for missing values (nan search over data rows)
% X = X(~any(isnan(X),2),:);

% get data matrix size
[I,J] = size(X);       
label = data{1};
% (dataset is made of 178 observations over 13 features)
% (first column corresponds to the cultivars type)

% get path to prtools
prpath='/Librerie/prtools';
addpath(prpath);

%%
%% 2. EXPLORING DATA
%%
% a. USING VARIANCE MEASUREMENT
% (calculate the variance for each feature to determine which one is best
% spread and easy to visualize)
% X = X-ones(I,1)*mean(X);
var_X = var(X);
[high_row,high_col] = find(var_X == max(abs(var_X)));
% feature no. 13 (proline) has the greatest variance

% plot every feature against feature no. 13 by group
for n = 1:12
    figure(n);
    gscatter(X(:,n),X(:,high_col),label);
end
% plotting feature no. 13 against feature no. 7 (Flavonoids) and no. 10
% (Color Intensity) shows the best separation among the 3 classes.
X713 = [X(:,7) X(:,13)];
X710 = [X(:,10) X(:,13)];

% create prdatasets over selected couple of features
% 1. flavonoids against proline dataset
z713 = prdataset(X713,label,'featlab',...
    ['Flavonoids';...
    'Proline   ']);
figure; scatterd(z713,'legend');

z710 = prdataset(X710,label,'featlab',...
    ['Color Intensity';...
     'Proline        ']);
figure; scatterd(z710,'legend');

% COMMENTS:
% First class is always well spaced and divided compared to
% the other two. I choose dataset based on feature no. 7 over 13 because it
% best divides each class from the others.
%%
% b. USING CORRELATION MEASURE
R = corr(X);
[x,y] = find(R == max(max(abs(R - diag(diag(R))))));

gscatter(X(:,x(1)),X(:,y(1)),label);
X76 = [X(:,7) X(:,6)];

z76 = prdataset(X76,label,'featlab',...
    ['Total phenols   ';...
     'Flavonoids      ']);
figure; scatterd(z76,'legend');

% COMMENTS:
% Dataset is not well divided if using the highest correlation features

%%
%% 3. SPLIT THE SET INTO TRAINING AND TESTING PART
% select training percentage (70 train/30 testing)
no_test = I*0.7;         

% calculate training index
train_idx = randperm(178,round(no_test))';
test_idx = setdiff([1:178],train_idx)';


train_X = X(train_idx,:);
test_X = X(test_idx,:);

z_train = prdataset(train_X,label(train_idx));
z_test = prdataset(test_X,label(test_idx));

%%
%% 4. FIT GAUSSIAN TO HISTOGRAM
% (in order to determine whether it is possible to use parametric
% classifiers or not, normality distribution condition for each class is
% needed)

% check label to divide set according to observation labels
idx_1 = find(label==1);
idx_2 = find(label==2);
idx_3 = find(label==3);

% facilities for probability distribution
mean_idx_1 = mean(X713(idx_1,:));
mean_idx_2 = mean(X713(idx_2,:));
mean_idx_3 = mean(X713(idx_3,:));
% full cov (QDA)
sig_idx_1 = cov(X713(idx_1,:));
sig_idx_2 = cov(X713(idx_2,:));
sig_idx_3 = cov(X713(idx_3,:));

% formulae for different covariance matrices
covType = 1; % 1: full cov
a = 5000; % scaling factor to match Gaussians and histograms

switch  covType,
    case 2,
       % diag (only var)
       sig_idx_1 = diag(diag(sig_idx_1));
       sig_idx_2 = diag(diag(sig_idx_2));
       sig_idx_3 = diag(diag(sig_idx_2));
    case 3,
        % sI matrix 
       sig_idx_1 = mean(diag(sig_idx_1))*diag(ones(2,1));
       sig_idx_2 = mean(diag(sig_idx_2))*diag(ones(2,1)); 
       sig_idx_3 = mean(diag(sig_idx_3))*diag(ones(2,1)); 
    case 4,
        % (Min. dist): pooled (LDA)
        sig_pool = (sig_idx_1+sig_idx_2+sig_idx_3)/3;
        sig_idx_1=sig_pool;
        sig_idx_2=sig_pool;
        sig_idx_3=sig_pool;
    case 5,
        % pooled (Minimum Distance)
        sig_pool = (sig_idx_1+sig_idx_2+sig_idx_3)/3;
        sig_pool=mean(diag(sig_pool))*diag(ones(2,1));
        sig_idx_1=sig_pool;
        sig_idx_2=sig_pool;
        sig_idx_3=sig_pool;
end

f = figure; hold on;
hist3(X713(idx_1,:),'FaceAlpha',.65,'FaceColor','red');
hist3(X713(idx_2,:),'FaceAlpha',.65,'FaceColor','green');
hist3(X713(idx_3,:),'FaceAlpha',.65,'FaceColor','blue');
grid on;
view(3);

x1 = min(X713(:,1)):.5:max(X713(:,1)); x2=min(X713(:,2)):20:max(X713(:,2));
[X1,X2] = meshgrid(x1,x2);

% plot Gaussians for each label class based on dataset with 
% two highest covariance features
F1 = mvnpdf([X1(:) X2(:)],mean_idx_1,sig_idx_1);
F1 = reshape(F1,length(x2),length(x1));
surf(x1,x2,F1*a,'FaceAlpha',.3); hold on;
contour(X1,X2,F1);

F2 = mvnpdf([X1(:) X2(:)],mean_idx_2,sig_idx_2);
F2 = reshape(F2,length(x2),length(x1));
surf(x1,x2,F2*a,'FaceAlpha',.3); hold on;
contour(X1,X2,F2);

F3 = mvnpdf([X1(:) X2(:)],mean_idx_3,sig_idx_3);
F3 = reshape(F3,length(x2),length(x1));
surf(x1,x2,F3*a,'FaceAlpha',.3); hold on;
contour(X1,X2,F3);

%%
%% 4. UNSUPERVISED LEARNING: PRINCIPAL COMPONENT ANALYSIS
%% Short definition and main goal
%
% (Principal component analysis (PCA) is a technique used to emphasize 
% variation and bring out strong patterns in a dataset)
% OR 
% (PCA is a way of identifying patterns in data, and expressing the 
% data in such a way as to highlight their similarities and differences)
%
%%
% EIGENVALUES DECOMPOSITION ON COVARIANCE MATRIX
c = cov(X); % covariance make the data be centered automatically

% (Since the covariance matrix is square, we can calculate the 
% eigenvectors and eigenvalues for this matrix)
[V,D] = eig(c);
eigval = diag(D);
[eigval,idx] = sort(eigval,'descend');
V = V(:,idx);

% a. SORTING and CUMULANT RELATIVE EIGENVALUES
cs = cumsum(eigval)/sum(eigval);    % cumulant relative eigenvalues
figure; plot(cs);
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13],'XTickLabel',...
    {'1.','2.','3.','4.', '5.','6.','7.','8.','9.','10.','11.','12.','13.'});
title('Cumulant relative eigenvalues')
% b. REDUCTION TO K-DIMENSION
L = size(X,1);
X = X - ones(L,1)*mean(X);         % centered dataset
Sc = X * V(:,1:2);                  % scores on the highest eigenvectors

z_train = prdataset(Sc,label,'featlab',...
    ['Score on 1.Eigenvector';
     'Score on 2.Eigenvector'],...
    'name','PCA Projection for 2 highest eigenvalues');
figure; scatterd(z_train);                % visualize scores
fprintf('Variance preserved: %f\n',sum(eigval(1:2))/sum(eigval));
% or: quotient of inertia
tau = sum(sum(Sc.^2,1))/sum(sum(X.^2,1))

% c. EIGENVECTORS CONTRIBUTION
figure;
for n = 1:2
    plot(V(:,n));
    hold on;
end
legend('eigenvector 1','eigenvector 2');
title('Features contribution for highest eigenvectors')
% the two highest eigenvectors are parallel to feature no. 13 and no. 5

% d. REDUCING DATA (from eigenvector analysis)
X513 = [X(:,5) X(:,13)];
z513 = prdataset(X513,label,'featlab',...
    ['Magnesium';
     'Proline  ']);
figure; scatterd(z513,'legend');
title('Feature 5 over 13')

% DISCUSSION
% how many eigenvectors?
% why?
% percentage of preserved variance in reconstructon:

%% 
% EIGENVALUES DECOMPOSITION ON CORRELATION MATRIX
% (Since the covariance matrix is square, we can calculate the 
% eigenvectors and eigenvalues for this matrix)
[Vr,Dr] = eig(R);
eigval_r = diag(Dr);
[eigval_r,idx_r] = sort(eigval_r,'descend');
Vr = Vr(:,idx_r);

% a. SORTING and CUMULANT RELATIVE EIGENVALUES
cs_r = cumsum(eigval_r)/sum(eigval_r);    % cumulant relative eigenvalues
figure; plot(cs_r);
title('Cumulant relative eigenvalues')
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13],'XTickLabel',...
    {'1.','2.','3.','4.', '5.','6.','7.','8.','9.','10.','11.','12.','13.'});

% b. REDUCTION TO K-DIMENSION
n_eig = 2;                                % number of eigenvalues chosen
Sr = X * Vr(:,1:n_eig);                  % scores on the highest eigenvectors

zr = prdataset(Sr,label,'featlab',...
    ['Score on 1.Eigenvector';'Score on 2.Eigenvector'],...
    'name','PCA Projection for 2 highest eigenvalues');
figure; scatterd(zr);                    % visualize scores

% c. EIGENVECTORS CONTRIBUTION
figure;
for n = 1:2
    plot(Vr(:,n));
    hold on;
end
legend('eigenvector 1','eigenvector 2');
title('Features contribution for highest eigenvectors')
fprintf('Variance preserved: %f\n',sum(eigval_r(1:n_eig))/sum(eigval_r));
% or: quotient of inertia
tau = sum(sum(Sc.^2,1))/sum(sum(X.^2,1))


X81 = [X(:,8) X(:,1)];
z81 = prdataset(X81,label,'featlab',...
    ['Nonflavonoid';
     'Alcohol     ']);
figure; scatterd(z81,'legend');
title('Feature 8 over 1')

%%
%% 5. SUPERVISED LEARNING: CLASSIFIERS 
%%
% Using cross-validation to detect the best-accuracy classifier
% and test it on the test dataset previously build
clc;


for n=1:5
    switch n
        case 1
            w_nmsc = nmsc([]);
            [e,cerr,nlab_out] = prcrossval(z_train,w_nmsc); 
            fprintf('\n---nmsc---\n');
        case 2
            w_ldc = ldc([]);
            [e,cerr,nlab_out] = prcrossval(z_train,w_ldc);
            fprintf('\n---ldc---\n');
        case 3
            w_qdc = qdc([]);
            [e,cerr,nlab_out] = prcrossval(z_train,w_qdc);
            fprintf('\n---qdc---\n');
        case 4
            w_knnc = knnc([]);
            [e,cerr,nlab_out] = prcrossval(z_train,w_knnc);
            fprintf('\n---knnc---\n');
        case 5
            w_svm = svc([],proxm('p',3));
            [e,cerr,nlab_out] = prcrossval(z_train,w_svm);
            fprintf('\n---svc---\n');
            
    end
    
    % facilities for analysis:
    % confusion matrix
    confmat(nlab_out,label(train_idx))
    cm = confmat(nlab_out,label(train_idx));
    % total errors number
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    % classifier accuracy
    fprintf('Accuracy with cross-validation: %f\n', 1 -e);
    pause
end

% COMMENTS:
% linear discriminant classifier is the most accurate

%%
% a. prdataset based on score calculated from PCA on covariance matrix
pr_tr = prdataset(Sc(train_idx',:),label(train_idx'));
pr_test = prdataset(Sc(test_idx',:),label(test_idx'));

for n=1:5
    switch n
        case 1
            w_nmsc=nmsc(pr_tr);
            pred_lab(:,n)=pr_test*w_nmsc*labeld;
            fprintf('\n---nmsc---\n');
        case 2
            w_ldc=ldc(pr_tr);
            pred_lab(:,n)=pr_test*w_ldc*labeld;
            fprintf('\n---ldc---\n');
        case 3
            w_qdc=qdc(pr_tr);
            pred_lab(:,n)=pr_test*w_qdc*labeld;
        case 4
            w_knnc = knnc(pr_tr);
            pred_lab(:,n)=pr_test*w_knnc*labeld;
            fprintf('\n---knnc---\n');
        case 5
            w_svm = svc(pr_tr,proxm('p',3));
            pred_lab(:,n)=pr_test*w_svm*labeld;
            fprintf('\n---svc---\n');
            
    end
    
    confmat(pred_lab(:,n),label(test_idx))         
    cm = confmat(pred_lab(:,n),label(test_idx));
    % total errors number
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    % classifier accuracy
    fprintf('Accuracy with PCA projection: %f\n',...
        sum(diag(cm))/sum(sum(cm)));
    pause
end

%%
% b. prdataset based on highest variance features
pr_tr = prdataset(X713(train_idx,:),label(train_idx));
pr_test = prdataset(X713(test_idx,:),label(test_idx));

for n=1:5
    switch n
        case 1
            w_nmsc=nmsc(pr_tr);
            pred_lab(:,n)=pr_test*w_nmsc*labeld;
            fprintf('\n---nmsc---\n');
        case 2
            w_ldc=ldc(pr_tr);
            pred_lab(:,n)=pr_test*w_ldc*labeld;
            fprintf('\n---ldc---\n');
        case 3
            w_qdc=qdc(pr_tr);
            pred_lab(:,n)=pr_test*w_qdc*labeld;
            fprintf('\n---qdc---\n');
        case 4
            w_knnc = knnc(pr_tr);
            pred_lab(:,n)=pr_test*w_knnc*labeld;
            fprintf('\n---knnc---\n');
        case 5
            w_svm = svc(pr_tr,proxm('p',3));
            pred_lab(:,n)=pr_test*w_svm*labeld;
            fprintf('\n---svc---\n');
            
    end
    
    confmat(pred_lab(:,n),label(test_idx))         
    cm = confmat(pred_lab(:,n),label(test_idx));
    % total errors number
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    % classifier accuracy
    fprintf('Accuracy with highest variance features: %f\n',...
        sum(diag(cm))/sum(sum(cm)));
    pause
end

%%
% c. prdataset based on highest correlation dataset
pr_tr = prdataset(X76(train_idx,:),label(train_idx));
pr_test = prdataset(X76(test_idx,:),label(test_idx));

for n=1:5
    switch n
        case 1
            w_nmsc=nmsc(pr_tr);
            pred_lab(:,n)=pr_test*w_nmsc*labeld;
            fprintf('\n---nmsc---\n');
        case 2
            w_ldc=ldc(pr_tr);
            pred_lab(:,n)=pr_test*w_ldc*labeld;
            fprintf('\n---ldc---\n');
        case 3
            w_qdc=qdc(pr_tr);
            pred_lab(:,n)=pr_test*w_qdc*labeld;
            fprintf('\n---qdc---\n');
        case 4
            w_knnc = knnc(pr_tr);
            pred_lab(:,n)=pr_test*w_knnc*labeld;
            fprintf('\n---knnc---\n');
        case 5
            w_svm = svc(pr_tr,proxm('p',3));
            pred_lab(:,n)=pr_test*w_svm*labeld;
            fprintf('\n---svc---\n');
            
    end
    
    confmat(pred_lab(:,n),label(test_idx))         
    cm = confmat(pred_lab(:,n),label(test_idx));
    % total errors number
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    % classifier accuracy
    fprintf('Accuracy with highest correlation features: %f\n',...
        sum(diag(cm))/sum(sum(cm)));
    pause
end

%%
% d. prdataset based on whole initial dataset
pr_tr = prdataset(X(train_idx,:),label(train_idx));
pr_test = prdataset(X(test_idx,:),label(test_idx));

for n=1:5
    switch n
        case 1
            w_nmsc=nmsc(pr_tr);
            pred_lab(:,n)=pr_test*w_nmsc*labeld;
            fprintf('\n---nmsc---\n');
        case 2
            w_ldc=ldc(pr_tr);
            pred_lab(:,n)=pr_test*w_ldc*labeld;
            fprintf('\n---ldc---\n');
        case 3
            w_qdc=qdc(pr_tr);
            pred_lab(:,n)=pr_test*w_qdc*labeld;
            fprintf('\n---qdc---\n');
        case 4
            w_knnc = knnc(pr_tr);
            pred_lab(:,n)=pr_test*w_knnc*labeld;
            fprintf('\n---knnc---\n');
        case 5
            w_svm = svc(pr_tr,proxm('p',3));
            pred_lab(:,n)=pr_test*w_svm*labeld;
            fprintf('\n---svc---\n');
            
    end
    
    confmat(pred_lab(:,n),label(test_idx))         
    cm = confmat(pred_lab(:,n),label(test_idx));
    % total errors number
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    % classifier accuracy
    fprintf('Accuracy with cross-validation: %f\n',...
        sum(diag(cm))/sum(sum(cm)));
    pause
end


%% 6. UNSUPERVISED LEARNING: CLUSTERING
% - try to compare clustering division with division perceivable using
% scatterplot comparison and see its efficiency in terms of accuracy
% - supposing any additional knowledge about dataset, e.g. labels
%
%%
% a. AGGLOMERATIVE CLUSTERING WITH SINGLE LINKAGE
clc;
                        
% linkage to cluster X
Z = linkage(X);
% define a threshold where to cut the clustering tree 
thr = 50:1:55; 
n = length(thr);
figure;

for k = 1: n
    % plot a dendrogram to visualize clustering tree
    title(['Threshold: ',thr(k)]);
    subplot(3,1,1)
    [H,T,order] = dendrogram(Z,'colorthreshold',thr(k));
    set(H,'LineWidth',2)

    % construct agglomerative clustering from linkage
    c = cluster(Z,'cutoff',thr(k),'criterion','distance');
    % see how cluster assignments correspond to the 3 original classes
    fprintf('Threshold = %d', thr(k));
    crosstab(c,label)
    
    % data visualization
    subplot(3,1,2)
%     scatter3(X(:,1),X(:,2),X(:,3),[],c,'MarkerEdgeColor','k',...
%         'MarkerFaceColor',[0 .75 .75]);
%     view(-30,10);
    scatter(X(:,7),X(:,13),[],c);
    
    subplot(3,1,3)
    gscatter(X(:,7),X(:,13),label);
    
    
    pause;  
end

% (is confusion matrix possible?)

%%
% b. K-MEANS CLUSTERING
% (using prtools kmeans function)

z = prdataset(X);
idx = prkmeans(z,3);
crosstab(idx,label)

figure;
subplot(2,1,1)
scatter(X(:,7),X(:,13),[],idx);
subplot(2,1,2)
gscatter(X(:,7),X(:,13),label);


%%
% c. EVALUATION USING VARIANCE-RATIO CRITERION

eva = evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:40])
figure; plot(eva.CriterionValues);
xlabel('Number of clusters')
ylabel('Variance-ratio Criterion')


%%
% d. GAUSSIAN MIXTURE MODEL
% (method for clustering and density estimation)
% - soft membership clustering: a point can belong to different clusters
% according to their expressed probability

no_gauss = 3;

GMModel = fitgmdist(X,no_gauss,'Options',statset('MaxIter',500,...
    'Display','iter'),'Replicates',100);

% estimate component-member posterior probabilities for all data points
P = posterior(GMModel,X);

% get cluster for each observation
M = zeros(I,1);
IM = zeros(I,1);
for n = 1:I,
    [M(n),IM(n)] = max(P(n,:));
end

crosstab(IM,label)

% plot errors

figure;
subplot(2,1,1)
gscatter(X(:,7),X(:,13),IM);
title('Gaussian Mixture Model clustering')
subplot(2,1,2)
gscatter(X(:,7),X(:,13),label);
title('True Labels')
fprintf('Total number of errors: %d\n',sum(sum(ans))-sum(diag(ans)));




% GMModel = fitgmdist(X713,no_gauss,'Options',statset('MaxIter',1000,...
%     'Display','iter'),'Replicates',10);
% % plot data over fitted Gaussian mixture model contour
% figure;
% h = gscatter(X(:,7),X(:,13),label);
% hold on
% ezcontour(@(x1,x2)pdf(GMModel,[x1 x2]),get(gca,{'XLim','YLim'}))
% title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}')
% legend(h,'Model 0','Model1')


%% 7. FEATURE SELECTION
% (automatic selection of attributes in dataset that are most relevant 
% to the predictive modeling problem)
%
% aim: create accurate predictive model 
%
%%
% a. using FILTER 
% (statistical measure to assign a scoring to each feature)
clc;

for j = 1:J,
    % correlates a single feature column j with the true training labels
    % return a correlation matrix and p-values matrix
    [r p]=corrcoef(train_X(:,j),label(train_idx));
    
    % keep correlations and p-values from off-diagonal
    R(j) = r(1,2);
    P(j) = p(1,2);
end

[~,rrank] = sort(R,'descend');

% select two features with highest correlation with labels
selfeat = rrank(1:2);
fprintf('Selected features from correlation: %d, %d\n', rrank(1:2));
% plot the scatterplot on those two features
scatterd(z_train(:,selfeat),'legend')

% test classifiers on dataset based on feature selection
n = 1; % 1: ldc; 2: nmsc; 3: qdc; 4: svm
for n=1:5
    switch n
        case 1
            w_nmsc = nmsc([]);
            [e,cerr,nlab_out] = prcrossval(z_train(:,selfeat),w_nmsc); 
            fprintf('\n---nmsc---\n');
        case 2
            w_ldc = ldc([]);
            [e,cerr,nlab_out] = prcrossval(z_train(:,selfeat),w_ldc);
            fprintf('\n---ldc---\n');
        case 3
            w_qdc = qdc([]);
            [e,cerr,nlab_out] = prcrossval(z_train(:,selfeat),w_qdc);
            fprintf('\n---qdc---\n');
        case 4
            w_knnc = knnc([]);
            [e,cerr,nlab_out] = prcrossval(z_train(:,selfeat),w_knnc);
            fprintf('\n---knnc---\n');
        case 5
            w_svm = svc([],proxm('p',3));
            [e,cerr,nlab_out] = prcrossval(z_train(:,selfeat),w_svm);
            fprintf('\n---svc---\n');
            
    end
    
    % facilities for analysis:
    % confusion matrix
    confmat(nlab_out,label(train_idx))
    cm = confmat(nlab_out,label(train_idx));
    % total errors number
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    % classifier accuracy
    fprintf('Accuracy with cross-validation: %f\n', 1 -e);
    pause
end

%%
% b. using WRAPPER
% split training to get validation set
no_val = size(train_idx,2)*0.2;
val_X = train_X(1:round(no_val),:);
train_X = train_X(round(no_val)+1:end,:);

% calculate new index for separating true label and assign them
% to the proper set
val_idx = train_idx(1:round(no_val));
train_idx = train_idx(round(no_val)+1:end);

% build new prdataset
z_train = prdataset(train_X,label(train_idx));
z_val = prdataset(val_X,label(val_idx));
z_test = prdataset(test_X,label(test_idx));

% feature selection using FORWARD SELECTION SCHEME
% - classifier w initialized
% - feat_no: features to be selected
feat_no = 2;
n = 1; % 1: ldc; 2: nmsc; 3: qdc; 4: svm
for n = 1:5,
    if (n == 1)
        w = ldc([]);
        fprintf('\n---ldc---\n');
    elseif (n == 2)
        w = nmsc([]);
        fprintf('\n---nmsc---\n');
    elseif (n == 3)
        w = qdc([]);
        fprintf('\n---qdc---\n');
    elseif (n == 4)
         w = knnc([]);
         fprintf('\n---knnc---\n');
    else
        w = svc([],'r');
        fprintf('\n---svc---\n');
    end
    
    
    % classification on validation dataset
    wsel = featselm(z_train,w,'forward',feat_no,z_val);
    % displays the two indices of the selected features
    featid{n} = wsel.data{1};
    fprintf('Selected features from forward selection: %d, %d\n', featid{n});
    % reduce training data using selected features
    
    if (n == 1)
        w = ldc(z_train*wsel);
    elseif ( n== 2)
        w = nmsc(z_train*wsel);
    elseif (n == 3)
        w = qdc(z_train*wsel);
    elseif (n == 4)
         w = knnc(z_train*wsel);
    else
        w = svc(z_train*wsel,'p',3);
    end
    
    res=labeld(z_test*wsel,w);
    acc(n)=sum(res==label(test_idx))/size(test_idx,1);
    confmat(label(test_idx),res)
    cm = confmat(label(test_idx),res);
    fprintf('Total number of errors: %d\n',sum(sum(cm))-sum(diag(cm)));
    fprintf('Accuracy: %f\n',acc(n));
    pause
end