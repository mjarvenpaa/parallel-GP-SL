function r = poissrnd_fast(lambda)
% This is a wrapper for the corresponding MATLAB function. The 
% (theta-)Ricker model simulation could however be made much faster by 
% copying the contents of the MATLAB's poissrnd here but without its input 
% checkings which are redundant in our case.

r = poissrnd(lambda);
end
