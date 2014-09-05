x = linspace(-4, 4, 500);
mu = x.^3 - 8*x;
plot(x, mu);
axis([-8, 8, -18, 18])
fprintf('Mean curve.  Press enter to sample\n')
pause

k = @(a,b) exp(-(a-b).^2);
X = meshgrid(x);
Sigma = k(X, X');
NUM_SAMPLES=100
y = mvnrnd(mu, Sigma, NUM_SAMPLES);

for i = 1:NUM_SAMPLES
    plot(x, y(i,:), '-', x, mu, 'r-', 'MarkerSize', 4);
    axis([-8, 8, -18, 18])
    pause(0.1)
end
