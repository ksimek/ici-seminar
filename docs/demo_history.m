x = linspace(-4, 4, 500);
mu = x.^3 - 8*x;
plot(x, mu); axis([-8, 8, -18, 18])
fprintf('Mean curve.  Press enter to sample\n')
pause
for i = 1:5
    delta = normrnd(0, 1, 1, length(x))
    plot(x, mu + delta, '-', 'MarkerSize', 4);
    axis([-8, 8, -18, 18])
    pause
end
