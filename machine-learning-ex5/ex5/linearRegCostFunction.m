function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% Linear regression hypothesis
hypothesis = X*theta;

% Squared errors metric
sqErrors = (hypothesis - y).^2;

% Non-regularized cost function
J = sum(sqErrors) / (2*m);
% Regularization term
J += (lambda/(2*m)) * sum(theta(2:end).^2);


% All gradient elements have a hypothesis term
% Always force this sum to be over the training examples (1st dim),
% otherwise, when there is only 1 training example (m = 1), the sum
% will be over the n columns of X (number of regression parameters),
% and grad will collapse to a scalar
grad = (1/m)*sum((hypothesis - y).*X, 1)';

% All but the first gradient element have an extra term due to the regularization
grad(2:end) += (lambda/m) * theta(2:end);

% =========================================================================

grad = grad(:);

end
