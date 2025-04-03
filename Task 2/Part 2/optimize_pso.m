function [best_solution, best_value] = optimize_pso(func)
    % Particle Swarm Optimization for the objective function
    nvars = 5;  % Number of dimensions
    lb = -5 * ones(1, nvars);  % Lower bound
    ub = 5 * ones(1, nvars);   % Upper bound
    
    options = optimoptions('particleswarm', 'SwarmSize', 50, 'MaxIterations', 100, 'Display', 'off');
    [best_solution, best_value] = particleswarm(func, nvars, lb, ub, options);
    
    disp(['PSO Best Solution: ', num2str(best_solution)]);
    disp(['PSO Best Value: ', num2str(best_value)]);
end