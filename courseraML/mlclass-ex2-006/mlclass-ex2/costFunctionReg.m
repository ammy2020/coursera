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

[tm,tn] = size(theta);

totalSum = 0;
for i = 1:m
  h = hx(X(i,:), theta);
  tmp = -y(i) * log(h) - (1 - y(i)) * log(1 - h) ;
  totalSum += tmp;
end

totalReg = sum(theta(2:end).^2);

%J = 1/m * totalSum + (lambda/m) * totalReg

h = sigmoid(X * theta);
J = 1/(2 * m) * (h - y)' * (h - y)+ (lambda/(2 * m)) * totalReg


for j = 1:tm
  tmpK = 0;
  for i = 1:m
    h = hx(X(i,:) , theta);
    tmp = ( h  - y(i) ) * X(i, j);
    tmpK = tmpK + tmp;
  end
  reg = lambda / m * theta(j);
  vv = 0;
  if(j ==  1)
    vv = 1/m * tmpK;
  else
    vv = 1/m * tmpK + reg;
  end
  grad(j) = vv;
end


% =============================================================
end
function h = hx(x, theta)
  h = sigmoid(x * theta);
end

