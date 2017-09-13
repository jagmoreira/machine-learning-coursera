function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

admitted = X(find(y==1),:);
notAdmitted = X(find(y==0),:);

plot(admitted(:,1), admitted(:,2), 'k+', 'markerSize', 8);
plot(notAdmitted(:,1), notAdmitted(:,2), 'ko', 'markerSize', 8, 'markerFaceColor', 'y');

xlabel('Exame 1 score');
ylabel('Exame 2 score');
legend("Admitted", "Not admitted");


% =========================================================================



hold off;

end
