function [peaks] = peakpickingBello(df,threshold,L,M)
% PEAK PICKING PROCESS (Bello, 2005)

% normalized weighted energy
maxDist = max(abs(df - mean(df)));
df = (df - mean(df)) / maxDist;

% moving average filter of order L
if exist('L','var') == 0
    L = 10;
end
B = 1/10*ones(L,1);
df = filter(B,1,df);

% variables for median local filter
if exist('M','var') == 0
    M = 8;
end
medianbuffer = zeros(M*2+1,1);
avE = zeros(length(df),1);
m = 0;

% variables for threshold
if exist('threshold','var') == 0
    threshold = 0.5; % heuristic
end
lambda = 0.5; %heuristic

while m < length(df)
        % get dfFrames between -Q/2 and Q/2
        for q = -M : M
            idx = m + q;
            % check if index are positive and not exceeding end pointer
            if idx+m < 1
            elseif idx+m < length(df)
                medianbuffer(q+M+1) = df(idx+m);
            else
                medianbuffer(q+M+1) = 0;
            end
        end
        
        % fill the average moving threshold vector
        medianbuffer = sort(abs(medianbuffer));
        avE(m+1) = threshold + lambda * medianbuffer(M+1);
        m = m + 1;
end

% subtract adaptive threshold
df = df - avE;
df = diff(df);

% pick every local maximum above 0 as onset
peaks = find(df > 0.05);

end

