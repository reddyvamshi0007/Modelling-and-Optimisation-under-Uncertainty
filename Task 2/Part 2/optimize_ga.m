function [best_solution, best_value] = optimize_ga(func)
    % Genetic Algorithm Optimization for the objective function
    nvars = 5;  % Number of dimensions
    lb = -5 * ones(1, nvars);  % Lower bound
    ub = 5 * ones(1, nvars);   % Upper bound
    
    options = optimoptions('ga', 'MaxGenerations', 100, 'PopulationSize', 50, 'Display', 'off');
    [best_solution, best_value] = ga(func, nvars, [], [], [], [], lb, ub, [], options);
    
    disp(['GA Best Solution: ', num2str(best_solution)]);
    disp(['GA Best Value: ', num2str(best_value)]);
end