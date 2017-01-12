function [peaks] = findPeaks(sig,df, method,frameNo,hop)
%FINDPEAKS: finding peaks depending the onset detection function and the
% peak picking process (Bello, or Dixon)

peaks = [];

switch method
    case 'Dixon'
        peaks = peakpickingDixon(df,frameNo);
    case 'Bello'
        peaks = peakpickingBello(df);
end

% plotting
figure;
plot(sig); hold on;
bpm = zeros(length(sig),1);
for i = 1:length(peaks)
    bpm(peaks(i)*hop) = 1;
    line([peaks(i)*hop,peaks(i)*hop],[0,4],'Color','r','linewidth',0.9);
end
set(gca, 'Ylim',[-1,1]);
grid on; xlabel('t (samples)');
legend('original signal','onset detection function',...
    'location','southwest')

end

