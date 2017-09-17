function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 

% row vector with desired powers
p_vec = (1:p);

% bsxfun applies a function element-wise to two array arguments, performing
% broadcasting where necessary.
% In this case it calculates X .^ p_vec to each element
% X has size (m, 1), p_vec has size (1, p), so
% resulting array will be broadcast to be (m, p) in size.

X_poly = bsxfun(@power, X, p_vec);

% =========================================================================

end
