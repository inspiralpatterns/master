function [GMM] = gmmFit(data,noComponents,regularizationValue,label)
%   author:             Mattia Paterna
%   created:            January, 15th 2017
%   last edit:          January, 18th 2017
%   function name:      gmmFit
%   purpose:            fit a Gaussian mixture model to data 
%   
%   input arguments
%       data:           data for gmm fitting
%       noComponents:   no of components for the gmm
%       regularizationValue: regularization parameter that is applied to
%       get a regularized model
%       label:          label connected to observation as a specific start
%       for the EM algorithm
%
%   output arguments
%       GMM:            gmm object
    

%   check for observation labels
if ~exist('label','var') == 1
    %   set a random sample start
    label = 'plus';
end

%   set covariance matrix
isShared = true;
covType = 'diagonal';

    try
        GMM = fitgmdist(data, noComponents,'Start',label,...
            'SharedCovariance',isShared,'CovarianceType',covType);
    catch exception
        warning('There was an error fitting the Gaussian mixture model')
        warning(exception.message)
        
        %   retry, but with regularization
        fprintf('Fitting with regularization, scalar value: %lf',...
            regularizationValue)
        GMM = fitgmdist(data, noComponents,'RegularizationValue',...
            regularizationValue,'Start',label,'SharedCovariance',isShared,...
            'CovarianceType',covType);
    end
end
