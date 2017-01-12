%% MSPR lecture 10, 02/XI/15
%% Gaussian Mixture Model

load heidi_analysis.mat

% Music in a logarithmic fashion: express the frequency as a distance from
% the reference frequency 0 Hz. 
% Frequency analysis by YIN algorithm

figure(1);
plot(t_sec,f_log2, '.');
ticks = [-1:2/12:1];
labels = {'A#^0/Bb^0','C^1','D^1','E^1','F#^1/Gb^1','G#^1/Ab^1','A#^1/Bb^1',...
    'C^2','D^2','E^2','F#^2/Gb^2','G#^2/Ab^2','A#^2/Bb^2'};

% plotting lines corresponding to the whole tones to better understand
% 1/6 is the logaritmic distance between notes (in the tempered system, the
% semitone distance is root(12,2)
for i= -1:1/6:1,
    line([0,15],[i,i],'Color','k','linewidth',1.5);
end
% mark octave in different color
for i = -1:1:1
        line([0,15],[i,i],'Color','r','linewidth',2);
end

% set some axes properties for better understanding
set(gca, 'Ylim', [-1,1], 'YTick', ticks, 'YTickLabel', labels);

% plotting histogram of frequencies
figure(2);
h = histogram(f_log2, [-1:1/12:1]);
h.NumBins = 25; %that is the octave interval
set(gca, 'Xlim', [-1,1], 'XTick', ticks, 'XTickLabel', labels);

%% Apply variance ratio criterion to determine number of notes played

eva = evalclusters(f_log2','kmeans','CalinskiHarabasz','KList',[1:60])
figure(3);
plot(eva.CriterionValues)
title('Heidi: Number of Clusters');
xlabel('Number of Clusters'); ylabel('Variance Ratio Criterion');

%% Fitting a gaussian to the histogram

m = mean(f_log2);
s2 = var(f_log2);
b = [-1:1/12:1]; %value on x-axis
h0 = h / (length(f_log2)*(b(2)-b(1))); %hist normalization
n = pdf('norm',b,m,sqrt(s2)); %normal distribution
bar(b,h0,'b'); hold on;
plot(b,n,'r')

% fitting is not good - that's why we need more gaussians.
% That leads to Gaussian Mixture Models.
%FIX ERROR

%% Gaussian mixture model (GMM)

opt = statset('MaxIter',300);
w = fitgmdist(f_log2',9,'Option',opt,'Replicates',20)
%values change every time we run the function, so we should get the best
%value for convergence
h = ezplot(@(x)pdf(w,x),[-1,1]) %produces a pdf with the GMM