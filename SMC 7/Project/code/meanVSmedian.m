%% COMPARISON BETWEEN MEAN AND MEDIAN FILTERING STAGE

% let's suppose values in range 0-50 meter
% let's simulate a trial sorting the values in descending order
fighandle = openfig('subject003.htrf.trial3.fig');
ax=findall(fighandle,'Type','line');
x=get(ax,'XData');
y=get(ax,'YData');
idx = 1:1:length(y{2});
interp_idx = 1:0.5:length(y{2});
% generate some random values, add outliers and sort them
% A = round(rand(100,1)*50);
% A = sort(A,'descend');
% for i = 1:20
%     tmp = round(rand*100);
%     A(tmp) = rand*25+25;
% end
DATA = [idx' y{2}'];
[J,K] = size(DATA);

x = 7; % numbers of values to compute filtering over
% preallocating arrays
M = zeros(J,1);
N = zeros(J,1);
 
% compute mean and median filter for consecutive chunks
figure;
plot(DATA(:,2),'k'); hold on;
for i= 1:J-x
    M(i,1) = mean(DATA(i:i+x-1,2));
    N(i,1) = median(DATA(i:i+x,2));
    %fprintf('Mean: %f, Median: %f\n',M(i,1),N(i,1)) check
end
int_N = interp1(idx,N,interp_idx,'spline');
plot(M,'b'); hold on;
plot(N,'r'); hold on;
%plot(interp_idx,int_N,'r');
xlabel('observations')
ylabel('distance (m)')
legend('raw data','mean filtered','median filtered')

