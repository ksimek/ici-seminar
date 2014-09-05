NUM_OBS=100
x = linspace(-4, 4, NUM_OBS);

k = @(a,b) exp(-(a-b).^2);
X = meshgrid(x);
Sigma_smooth = k(X, X');
NUM_SAMPLES=100

mu = mvnrnd(zeros(NUM_OBS, 1), Sigma_smooth);
plot(x, mu);
fprintf('Mean curve.  Press enter to sample\n')
pause

Sigma_noise = eye(NUM_OBS) * 0.1^2;

y = mu + mvnrnd(zeros(NUM_OBS, 1), Sigma_noise);

missing_data=true;

if missing_data
    K_y = Sigma_smooth + Sigma_noise;
    I = [1:30 70:100];
    K_y = K_y(I,I);
    y = y(I);
    mu_hat = Sigma_smooth(:, I) * inv(K_y) * y';
    plot(x, mu, x(I), y, '.', x, mu_hat);
else
    mu_hat = Sigma_smooth * inv(Sigma_smooth + Sigma_noise) * y';
    plot(x, mu, x, y, '.', x, mu_hat);
end
