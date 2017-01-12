%% MSPR Lecture VII - homework
%% Exercise 2

fid=fopen('iris.data.txt');
data=textscan(fid,'%f%f%f%f%s','delimiter',','); 
X=[data{1},data{2},data{3},data{4}];
species=data{5};
fclose(fid);

idx_train=[51:75,101:125];
idx_test=idx_train+25;

prpath='/Librerie/prtools';
addpath(prpath);

pr_train=prdataset(X(idx_train,:),species(idx_train));
pr_test=prdataset(X(idx_test,:),species(idx_test));
pr_train_w=ldc(pr_train); %linear discriminant analysis
pred_lab=pr_test*pr_train_w*labeld; %predicted labels from test data
true_lab=species(idx_test); %true labels from test data
cmat=confmat(true_lab,pred_lab);
confmat(true_lab,pred_lab)

%TP:24
%FP:2
%FS:1
%TN:23

recall=cmat(1,1)/sum(cmat(1,:));
precision=cmat(1,1)/sum(cmat(:,1));
fmeasure=(2*precision*recall)/(precision+recall);
accuracy=sum(diag(cmat))/sum(sum(cmat));
far=cmat(2,1)/sum(cmat(2,:));

e=prroc(pr_test,pr_train_w);
r=1-e.xvalues;
f=e.error;
%question: which of the two graph is the correct one?
figure;plote(e);
figure;plot(f,r);
%AUC area
auc=1-(pr_test*pr_train_w*testauc);

%% Exercise 3

%import adult dataset
clear;
fid=fopen('adult.data.txt');
data=textscan(fid,'%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s','delimiter',',');
fclose(fid);

%convert categorical variables into numerical ones
%use double to convert a bynary/boolean into double
data{10}=double(strcmp(data{10},'Male'));
data{9}=double(strcmp(data{9},'White'));
data{14}=double(strcmp(data{14},'United-States'));
X=[data{1},data{3},data{5},data{9},data{10},data{11},data{12},data{13},data{14}];
income=data{15};
income=strcmp(income,'<=50K')+2*strcmp(income,'>50K');

X_pr=prdataset(X,income);
e=zeros(1,3);
for n=1:3
    switch n
        case 1
            w=nmsc([]);
            [e(1,n),cerr(n,:),pred_lab(:,n)]=prcrossval(X_pr,w,10);
        case 2
            w=ldc([]);
            [e(1,n),cerr(n,:),pred_lab(:,n)]=prcrossval(X_pr,w,10);
        case 3
            w=qdc([]);
            [e(1,n),cerr(n,:),pred_lab(:,n)]=prcrossval(X_pr,w,10);
    end
    
            cmat=confmat(pred_lab(:,n),income);
            confmat(pred_lab(:,n),income) %display confusion matrix
            recall=cmat(1,1)/sum(cmat(1,:));
            precision=cmat(1,1)/sum(cmat(:,1));
            fmeasure(1,n)=(2*precision*recall)/(precision+recall);
            disp('fmeasure:')
            disp(fmeasure(1,n));
            
end

%DISCUSSION
%nsmc is the less accurate in order to predict the percentage of
%real poor (23228 against 23460 and 23584, the best value we can obatain
%choosing the qdc). However, nmsc is the best classifier to predict the percentage of rich class though.
%It's noticeable also how qdc tends to predict a higher percentage for the
%poor class altough the number of false negative is the highest.
%To sum up, nmsc is the most accurate owing to the number of wrong
%prediction is the least (6119 agains 6149 and 6690). Its F-measure value
%confirms the trend. Nmsc has the tendency to make more balanced prediction
%between real rich and poor class percentages, while qdc has the tendency
%to predict more poors than in reality.



%SELF ASSESSMENT
%2a,2b,2c: seriously
%2d,3: very seriously





