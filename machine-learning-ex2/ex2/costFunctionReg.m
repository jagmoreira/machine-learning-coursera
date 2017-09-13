function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

hypothesis = sigmoid(X*theta);

logErrors = -y.*log(hypothesis) - (1 - y).*log(1 - hypothesis);

% Cost function plus regularization term
J = sum(logErrors)/(1*m) + (lambda/(2*m))*sum(theta(2:length(theta)).^2);
%                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% All gradient elements have a hypothesis term
grad = (1/m)*sum((hypothesis - y).*X);

% All but the first gradient element have an extra term due to the regularization
grad(2:length(grad)) += (lambda/m) * theta'(2:length(theta));

% =============================================================

end
