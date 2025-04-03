% F2: Optimize Griewank's Function using GA, PSO, and SA
clc;
clear;

% Number of dimensions
nvars = 5;
% Bounds for the search space
lb = -5 * ones(1, nvars);  
ub = 5 * ones(1, nvars);

% Initialize result containers for 15 runs
ga_results = zeros(15, 1);
pso_results = zeros(15, 1);
sa_results = zeros(15, 1);

% Run optimization 15 times for F2 (Griewank)
for i = 1:15
    % GA Optimization
    options_ga = optimoptions('ga', 'MaxGenerations', 100, 'PopulationSize', 50, 'Display', 'off');
    [~, ga_results(i)] = ga(@griewank, nvars, [], [], [], [], lb, ub, [], options_ga);

    % PSO Optimization
    options_pso = optimoptions('particleswarm', 'SwarmSize', 50, 'MaxIterations', 100, 'Display', 'off');
    [~, pso_results(i)] = particleswarm(@griewank, nvars, lb, ub, options_pso);

    % SA Optimization
    options_sa = optimoptions('simulannealbnd', 'MaxIterations', 100, 'Display', 'off');
    [~, sa_results(i)] = simulannealbnd(@griewank, rand(1, nvars), lb, ub, options_sa);
end

% Calculate statistics (best, worst, average)
ga_best = min(ga_results);
pso_best = min(pso_results);
sa_best = min(sa_results);

ga_avg = mean(ga_results);
pso_avg = mean(pso_results);
sa_avg = mean(sa_results);

ga_std = std(ga_results);
pso_std = std(pso_results);
sa_std = std(sa_results);

% Display results
disp(['F2 (Griewank) - GA Best: ', num2str(ga_best), ', Avg: ', num2str(ga_avg), ', Std: ', num2str(ga_std)]);
disp(['F2 (Griewank) - PSO Best: ', num2str(pso_best), ', Avg: ', num2str(pso_avg), ', Std: ', num2str(pso_std)]);
disp(['F2 (Griewank) - SA Best: ', num2str(sa_best), ', Avg: ', num2str(sa_avg), ', Std: ', num2str(sa_std)]);