clear;
close all;

filename = 'test1.wav';
[x,fs] = audioread(filename);
gtfilename = 'test1.jnt';

% sum to mono
x = mean(x,2);

%% COMPLEX SPECTRAL DIFFERENCE ONSET DETECTION FUNCTION (df)
% (Stark, 2009/Davies, 2007)

% obs: also spectral and phase features onset detection functions have been
% implemented

% frame size
N = 1024;
% hop size
h = N/4;
% no. of frame
frameNo = round(length(x)/h);
% analysis window
win = hann(N);

% loop parameters
pin = 0;
pend = length(x) - N;
i = 1;
% difference function sample number
k = 0;

% vectors allocation
fftBuf = zeros(N,1);
Xk = zeros(N,1);
phi1 = zeros(N/2,1);
phi2 = zeros(N/2,1);
mag = zeros(N/2,1);
oldMag = zeros(N/2,1);
dev = zeros(N/2,1);

% output offset detection function
df = zeros(frameNo,1);

% spectral energy vector
E = zeros(frameNo,1);
% phase deviation onset vectors
Pd = zeros(frameNo,1);
Nwpd = zeros(frameNo,1);

% HFC weigthing (Masri)
Wk = [sort(1:N/2,'descend'),1:N/2];

while pin < pend
    % ----- spectral features (Bello, 2005)
    % STFT
    % segment and windowing
    fftBuf = x(pin+1:pin+N).*win;
    Xk = fft(fftBuf);
    
    % weighted energy measure with HFC (Masri, 1996)
    e = 1/N*(Wk*abs(Xk).^2);
    E(i) = e;
    
    %----- end of energy-based onset detection
    
    
    %----- complex spectral difference part
    k = k + 1;
    
    % spectrum in range [-fs/2 fs/2]
    Xk = fftshift(Xk);
    % discard first half of the spectrum
    Xk = Xk(floor(length(Xk))/2+1:length(Xk),:);
    % take magnitude and phase angle from FFT
    mag = abs(Xk);
    phi = angle(Xk);
    % phase deviation (Bello, 2004)
    % unwrap and map in range [-pi,pi] (princarg: Davies, 2007)
    dev = princarg(phi - 2*phi1 + phi2); % i.e. second phase difference
    
    %----- spectral features using phase (Bello,2005)
    % mean absolute phase deviation onset detection function
    Pd(k) = 1/length(dev) * sum(abs(dev));
    % (alternatively: mean(abs(dev))
    
    % normalised weighted phase deviation (Dixon, 2006)
    Nwpd(k) = sum((abs(dev).*mag)) / sum(mag);

    %----- end of phase deviation onset detection
    
    
    %----- complex spectral difference function (Davies, 2007)
    % spectral prediction in complex domain
    Sk = oldMag - (mag.*exp(1i.*dev));
    % DF for sample k
    % (sum of the Euclidean distance between predicted and observed for all
    % k-bins)
    df(k) = sum(sqrt(real(Sk).^2 + imag(Sk).^2));
    
    % vectors update
    phi2 = phi1;
    phi1 = phi;
    oldMag = mag; % prediction of magnitude spectrum (Davies, 2007)
    
    % counters update
    pin = pin + h;
    i = i + 1;
end


%% PEAK PICKING PROCESS (and plotting)
dfPeaks = findPeaks(x,df,'Dixon',frameNo,h);
Epeaks = findPeaks(x,E,'Dixon',frameNo,h);
Pdpeaks = findPeaks(x,Pd,'Bello',frameNo,h);
NwpdPeaks = findPeaks(x,Nwpd,'Bello',frameNo,h);


%% EVALUATION
% compare groundtruth with detected onset and get F-measure

dfeval = fmeas(gtfilename,dfPeaks,fs,h);
Eeval = fmeas(gtfilename, Epeaks,fs,h);
Pdeval = fmeas(gtfilename, Pdpeaks,fs,h);
NwpdEval = fmeas(gtfilename, NwpdPeaks,fs,h);

%% GENERAL STATE FOR BEAT TRACKING (Davies, 2007)
% (infers: beat period first and beat alignment then)

% resolution per detection function
res = 0.01161;
% length of overlapping frames (should be 512)
dfFrames = round(fs*res);
% hop for overlapping frames (overlap of 75%)
hFrames = dfFrames/4;

% interpolate each detection function by a factor of 2 to get resolution of 11.6ms
% (allow the beat tracker to operate indipendently of fs)
df = interp1((1:length(df))*res,df,(1:0.5:length(df))*res,'pchip')';

% variables for adaptive moving threshold
Q = 16;
pre = -Q/2 + 1;
post = Q/2 + 1; % indexes in Matlab start from 1
tmpDfMeans = zeros(Q+1,1);
dfI = zeros(dfFrames,1);
beatInd = 0;

% variable for beat period induction
% create a Rayleigh distribution for weighting
rayBeta = 43; % strongest point of weigthing (= 120 bpm)
Tau = 1:hFrames; % underlying periodicity (max = 40 bpm)
wc = (Tau./(rayBeta^2)).*exp(-Tau.^2/(2*rayBeta^2));
% alternatively: raylpdf(Tau,43)

% comb filter-type structure parameters
comblen = 4; % four comb element within each comb template
cf = zeros(1,length(Tau)); % comb template
Fg = zeros(dfFrames,length(Tau)); % filterbank
yg = zeros(length(Tau),1); % output vector

% pointers
m = 0;
pin = 0;
pend = length(df) - dfFrames;

while pin < pend
    % split df into overlapping frames
    segment = df(pin+1:pin+dfFrames);
    beatInd = beatInd + 1;
    
    % A. adaptive, moving mean threshold
    while m < dfFrames
        % get dfFrames between -Q/2 and Q/2
        for q = pre : post
            dfInd = m + q;
            % check if index are positive and not exceeding end pointer
            if dfInd < 1
                tmpDfMeans(q+Q/2+1) = 0;
            elseif dfInd < dfFrames
                tmpDfMeans(q+Q/2+1) = segment(dfInd);
            else
                tmpDfMeans(q+Q/2+1) = 0;
            end
        end
        
        % fill the average moving threshold vector
        dfI(m+1) = mean(tmpDfMeans);
        m = m + 1;
    end
    
    % B. subtract adaptive threshold from original DF function
    dfZeroMean = segment - dfI;
    
    % C. half-wave rectification
    hwr = @(x) (x+abs(x))/2;
    dfMod = hwr(dfZeroMean);
    
    % D. autocorrelation function
    % (using Matlab FFT for more efficience)
    X = fft(dfMod,2^nextpow2(2*dfFrames));
    acf = ifft(X.*conj(X));
    % normalize to correct the bias
    acf = acf(1:dfFrames)./(dfFrames:-1:1)';   
    
    % E. get the beat period using comb filter-type structures
    % (multiple normalization for it to be metrically unbiased)
    
    % "combine a number of comb templates to span the range of beat period
    % hypotheses into a shift-invariant comb filterbank" (Davies)
    for l = 1:dfFrames
        tau = 0;
        
        while tau < length(Tau)-1
            tau = tau + 1;
            
            for p = 1:comblen
                for v = 1-p:p-1
                    hNorm = 2*pi - 1; % heigth normalization
                    cf(tau) =  cf(tau) + (l-tau*p)/hNorm; % eq. 7
                end
            end
        end
        
        % approximate prior distribution of beat period hypotheses
        % apply the Rayleigh weigthing curve
        Fg(l,:) = cf.*wc; % eq. 9
    end
    
    % product of acf with Ft (function of tau)
    tau = 0;
    while tau < length(Tau)-1
        tau = tau + 1;
        yg(tau) = sum(Fg(:,tau).*acf);
    end
    
    beatPeriod(beatInd) = find(yg == max(yg));
    
    pin = pin + hFrames;
    m = 0; % reset counter for adaptive threshold
end

% discard first and last beat period
beatPeriod = beatPeriod(2:end-1);
plot(beatPeriod, '*');

