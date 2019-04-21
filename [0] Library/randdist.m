function [distribution] = randdist(sigma, mu, amount)
%RANDDIST returns a normally distributed array of values from 0 to 1 with
%variance sigma and mean mu.
distribution = sigma * randn(1, amount) + mu;
end

