function ss_x = ricker_summstats(x,y)
% Compute the summary statistics used in the Ricker model (as in Wood 2010)
%
% INPUT:
% x - simulated data
% y - observed data
%
% OUTPUT:
% ss_x - summary statistics for the simulated data x


% Autocovariances up to lag 5 
% [3 summaries]
[ss1x,lagsx] = xcov(x,5,'unbiased');
ind_ss1x = ((length(ss1x)+1)/2);
ss1x = ss1x(ind_ss1x:end);

% Coefficients of the cubic regression of order differences on their observed values
% [6 summaries]
order_diff = 1;
x_diff = diff(x, order_diff); y_diff = diff(y, order_diff);
x_diff = sort(x_diff); y_diff = sort(y_diff);
x_diff2 = x_diff - repmat(mean(x_diff),length(x_diff),1);
y_diff2 = y_diff - repmat(mean(y_diff),length(y_diff),1);
ss2x = regress(x_diff2, [y_diff2, y_diff2.^2, y_diff2.^3]);

% Coefficients of the autoregression
% y_{t+1}^{0.3} = beta_{1} y_{t}^{0.3} + beta_{2} y_{t}^{0.6} + epsilon_{t}
% [2 summaries - beta_{1} and beta_{2}]
x_mod = x.^0.3;
x_mod = x_mod - repmat(mean(x_mod),length(x_mod),1);
x_mod2 = x_mod(2:end); 
x_pred2 = x_mod(1:end-1);
ss3x = regress(x_mod2, [x_pred2, x_pred2.^2]);

% mean population [1 summary]
ss4x = mean(x);

% number of zeros observed [1 summary]
ss5x = sum(x == 0);

% Combining all summary statistics into a vector
ss_x = [ss1x;ss2x;ss3x;ss4x;ss5x];

end



