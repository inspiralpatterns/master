function [peaks] = peakpickingDixon(df,frameNo,threshold)
% PEAK PICKING PROCESS (Dixon, 2006)

% "each onset detection function is normalised to have zero-mean and std of 1"
df = (df-mean(df))/std(df);

% 1. find a local maxima using average moving threshold
w = 3; % size of window for local maximum
m = 3; % multiplier for mean calculation over a larger range 

if exist('threshold','var') == 0
    threshold = 0.3; % threshold above local mean (heuristic)
end

alpha = 0.3;
% calculate threshold function g(n)
g = zeros(length(df),1);
for n = 1: length(df)
    if n-1 > 0
        g(n) = max(df(n),alpha*g(n-1) + (1-alpha)*df(n));
    end
end
peaks = [];
tmpbuffer = zeros((w*2+1),1);
meanbuffer = zeros((w*4+1),1);
i = 1;

% 2. check the conditions for a DF values to be peak
for n = 1:frameNo
    for q = -w : w
        % check if index are positive and not exceeding end pointer
        if n+q < 1
        elseif n+q > frameNo
            tmpbuffer(q+w+1) = 0;
        else
            tmpbuffer(q+w+1) = df(n+q);
        end
    end
    
    % check if f(n) is non smaller than window values
    if tmpbuffer(4) >= max(tmpbuffer(1:6))   
        % second condition for true peak (Dixon, 2006)
        for j = (-w)*m:-(w+1)
            if n+j > 0
                meanbuffer(j+(w*m)+1) = df(n+j);
            end
        end
        
        % collect all local DF values and compare with their mean
        meanbuffer(w*2+1:end) = tmpbuffer;
        
        if df(n) >= mean(meanbuffer)+threshold
            % third condition for true peak (Dixon, 2006)
            if df(n) >= g(n-1) 
        
                % if DF sample is fulfilling all conditions, it's a peak
                peaks(i) = n;
                i = i + 1;
                oldG = g;
            end
        end
    end
end

end

