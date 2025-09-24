function [result] = eucledianDistDummy(X, N , D)
    result = zeros(N, D);
    for i = 1:N
        for j = 1:D
            xi = X(i, :);
            xj = X(j, :);
            % Calculate the norm
            result(i, j) = sqrt(norm(xi) + norm(xj) - 2 * dot(xi, xj));
        end
    end
end

function [result] = eucledianDistMatrix(X)
    norm_squared = sum(pow2(X), 2);
    dot_product = dot(X, X');
    result = sqrt(norm_squared + norm_squared' - 2 * (dot_product));
end

% Set up the inputs (100, 200, ..., 1000)
inputs = (100:100:1400)';
rng(1);  % Initialize seed for reproducibility

% Pre-allocate arrays for timing results
times_dummy = zeros(length(inputs), 1);
times_matrix = zeros(length(inputs), 1);

% Calculate the Euclidean pairwise distance for 100x100, 200x200, ..., 1000x1000
for k = 1:length(inputs)
    N = inputs(k);
    D = inputs(k);
    X = rand(N, D);  % Generate random matrix X
    
    % Time the eucledianDistDummy function
    tic;
    eucledianDistDummy(X, N, D);
    times_dummy(k) = toc;  % Store elapsed time
    
    % Time the eucledianDistMatrix function
    tic;
    eucledianDistMatrix(X);
    times_matrix(k) = toc;  % Store elapsed time
end

figure;
% Plot runtime for eucledianDistDummy
plot(inputs, times_dummy, '-b', 'LineWidth', 2);
hold on
plot(inputs, times_matrix, '-r', 'LineWidth', 2);
title('Runtime of eucledianDist Dummy vs Matrix');
xlabel('Matrix Size (N x D)');
ylabel('Time (seconds)');

% Plot runtime for eucledianDistMatrix
legend('show');  % Display the legend
grid on;

saveas(gcf, "Runtime of eucledianDistDummy_vs_Matrix.png")
