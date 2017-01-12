%% MSPR10 homework
%% Exercise 2
%% PART A

load firstPlagal.mat
figure('Name','Pitch VS Time');
plot(t_sec,f_log2, '.');
title('Byzantine Monk');
set(gca, 'Ylim', [-1,1],'YTick',ticks,'YTickLabel',labs,'FontSize', 12);
for i= ticks,
    line([0,15],[i,i],'Color','k','linewidth',1.3);
end
% mark octave in different color
for i = -1:1:1
        line([0,15],[i,i],'Color','r','linewidth',2);
end

%% PART B

nBins = 16;
figure('Name','Pitches histogram');
[h,b] = hist(f_log2,nBins);
h_norm=h/(length(f_log2)*(b(2)-b(1)));
bar(b,h_norm); hold on;
for i= ticks,
    line([i,i],[0,4],'Color','g','linewidth',0.7);
end
set(gca, 'Xlim',[-1,1],'XTick',ticks,'XTickLabel',labs);

%% PART C
%(univariate parametric density estimation)

m = mean(f_log2);
s2 = var(f_log2);
n = pdf('norm',b,m,sqrt(s2)); %normal distribution
plot(b,n,'r'); hold on;

%fitting is quite good, even if the II and the V degrees exceed the curve

%% PART D
%(multivariate parametric density estimation)

itNo = 2000;
opt = statset('MaxIter',itNo);
w = fitgmdist(f_log2,7,'Option',opt,'Replicates',30)
h = ezplot(@(x)pdf(w,x),[-1,1,0,4]);


%% PART E
%(kernel smoothing)

bw = 0.1;
[h_ks,b_ks,bw] = ksdensity(f_log2,'bandwidth',bw);
plot(b_ks,h_ks,'y');
legend('kernel smoother');


%% PART F















