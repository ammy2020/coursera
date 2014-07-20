function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

  total = zeros(2,1)
  for i = 1:m
    distance = X(i,:) * theta - y(i,:)
    tmp = distance * X(i,:)'
    total = total + tmp
  end

  tmp = alpha * total * 1/m

  theta = theta - tmp
   
  J_history(iter) = computeCost(X, y, theta);

end

end
