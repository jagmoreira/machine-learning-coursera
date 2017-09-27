function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Selected values of C and sigma
% steps_vec = [0.1 1]';  % Testing values
steps_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';

% Storing the prediction errors for each pair (C_i, sigma_j)
error_val = zeros(length(steps_vec));

for i = 1:length(steps_vec)
    for j = 1:length(steps_vec)
        C_i = steps_vec(i);
        sigma_j = steps_vec(j);
        
        % Fit the model to each training sub-set
        model = ...
            svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_j));
        
        % Predict labels on the cross-validation set
        predictions = svmPredict(model, Xval);

        % Calculate the prediction error on the validation set
        error_val(i, j) = mean(double(predictions ~= yval));
    
        fprintf('Trained SVM with C=%f and sigma=%f\n', C_i, sigma_j);
    end
end

% reshape error matrix into single column and 
% find the (linear) index of the minimum element 
[min_error, ind] = min(error_val(:));
% Then use a built-in function to convert the linear index
% into row and column indices
% (This way we only search the error matrix once
[m, n] = ind2sub(size(error_val),ind);

C = steps_vec(m);
sigma = steps_vec(n);

% =========================================================================

end
