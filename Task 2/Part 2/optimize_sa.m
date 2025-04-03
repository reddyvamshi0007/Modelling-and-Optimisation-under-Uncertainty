function [best_solution, best_value] = optimize_sa(func)
    % Simulated Annealing Optimization for the objective function
    nvars = 5;  % Number of dimensions
    lb = -5 * ones(1, nvars);  % Lower bound
    ub = 5 * ones(1, nvars);   % Upper bound
    
    % Initialize the starting point randomly
    x0 = rand(1, nvars) .* (ub - lb) + lb;  % Random starting point

    % Define Simulated Annealing options with more gradual temperature decay
    options = optimoptions('simulannealbnd', ...
                           'MaxIterations', 100, ...
                           'InitialTemperature', 100, ...  % Start with a higher temperature
                           'TemperatureFcn', @temperatureexp, ... % Exponential temperature schedule
                           'Display', 'off');
    
    % Run the optimization
    [best_solution, best_value] = simulannealbnd(func, x0, lb, ub, options);
    
    disp(['SA Best Solution: ', num2str(best_solution)]);
    disp(['SA Best Value: ', num2str(best_value)]);
end