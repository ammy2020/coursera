function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

J = 0;

  for i = 1:m
    predict = X(i,:) * theta
    err = predict - y(i,:)
    tmp = err * err
    J += tmp
  end

  J = 1/(2*m) * J

end
