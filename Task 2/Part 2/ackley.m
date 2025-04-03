function f = ackley(x)
    % Ackley’s Function (Shifted and Rotated)
    % Parameters: Dimension = 5 (example)
    n = length(x);
    a = 20;
    b = 0.2;
    c = 2 * pi;
    sum1 = sum(x.^2);
    sum2 = sum(cos(c * x));
    
    f = -a * exp(-b * sqrt(sum1 / n)) - exp(sum2 / n) + a + exp(1);
end