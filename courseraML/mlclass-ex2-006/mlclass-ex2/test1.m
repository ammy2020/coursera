data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);
postive = find(y==1);
negivate = find(y==0);
plot(X(postive,1), X(postive,2), 'k+','LineWidth', 2, 'MarkerSize', 7);
plot(X(negivate,1), X(negivate,2), 'ko','LineWidth', 2, 'MarkerSize', 7);