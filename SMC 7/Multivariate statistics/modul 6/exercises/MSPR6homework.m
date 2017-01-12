%% MSPR VI homework
%% Exercise 3

%import adult dataset
fid=fopen('adult.data.txt');
data=textscan(fid,'%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s','delimiter',',');
fclose(fid);

%convert categorical variables into numerical ones
%use double to convert a bynary/boolean into double
s1='Male';
data{10}=double(strcmp(data{10},s1));
s1='White';
data{9}=double(strcmp(data{9},s1));
s1='United-States';
data{14}=double(strcmp(data{14},s1));
s1='>50K';
data{15}=double(strcmp(data{15},s1));

X=[data{1},data{3},data{5},data{9},data{10},data{11},data{12},data{13},data{14}];

%choice training data over the adult dataset
income=data{15};
idx_test=[7467;10326;1468;14346;29201;22570;11016;10148;31436;30489];
idx_rich=find(income==1);
idx_poor=find(income==0);
idx_rich_tr=setdiff(idx_rich,idx_test);
idx_poor_tr=setdiff(idx_poor,idx_test);
%order diff values
idx_rich_test=find(income(idx_test)==1);
idx_poor_test=find(income(idx_test)==0);

idx_test=idx_test([idx_rich_test;idx_poor_test],:);
idx_tr=[idx_rich_tr;idx_poor_tr];

prpath='/Librerie/prtools';
addpath(prpath);

%build prdataset
prtr=prdataset(X([idx_tr],:),income([idx_tr]));
prtest=prdataset(X([idx_test],:),income([idx_test]));

%Classification and estimation
prw=zeros(1,3);
for n=1:3
    switch n
        case 1
            prw_nmsc=nmsc(prtr);
            pred_lab(:,n)=prtest*prw_nmsc*labeld;
        case 2
            prw_ldc=ldc(prtr);
            pred_lab(:,n)=prtest*prw_ldc*labeld;
        case 3
            prw_qdc=qdc(prtr);
            pred_lab(:,n)=prtest*prw_qdc*labeld;
    end
    
    confmat(pred_lab(:,n),income(idx_test))
end

%worked on very seriously!
