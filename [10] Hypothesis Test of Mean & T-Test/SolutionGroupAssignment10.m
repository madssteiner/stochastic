%% Solution to Hypothesis testing Women Height Study
clear all
close all
% Hypothesis test on a height study
%% Edited by GEK@ase.au.dk. at 5/11-2

% sample women heights (wh) given:
wh = [1.66 1.69 1.5 1.8 1.68 1.64 1.65 1.7 1.72 1.67 1.69 1.68 1.20 1.9 1.2];

% Population is assumed to be gaussian distributed with mean (my) and
% variance (sig2) of:
Mu = 1.68;
Stdder = 0.2;

%% 1) Estimate the mean of the population
Muhat = sum(wh)/length(wh)

%% 2) Formulate the NULL hypothesis to test whether the sample has the
% sample mean as the same mean as the rest of the population

% Muhat = Mu;

%% 3) Formulate the alternative hypothesis to the NULL hypothesis

% Muhat != Mu;

%% 4) Calculate the test statistics z.

n = length(wh); % number of samples
z = (Muhat - Mu)/(Stdder/sqrt(n)) % equation 6 in LN

%% 5) Find the p-value based on a Gaussian pdf

% we see that myhat is below my and thus 2*Pr(Z<z) is our p value, BUT we
% can also let matlab figure it out for us

% just like in LN we find the smallest value of Pr(Z<z) and Pr(Z>z), 
% recall that Pr(Z>z) = 1 - Pr(Z<z)
% and when using our normalized z-score we can use mean = 0 and std = 1
p = 2 * min(normcdf(z,0,1),1 - normcdf(z,0,1))

%% 6) With a significance level of alfa = 0.05, can we reject the NULL hypothesis?

% since p > alfa the NULL hypothesis can not be rejected

%% 7) If we change the significance level to alfa = 0.1, what would that imply?

% we still have p > alfa so it doesn't really change anything

%% 8) Now repeat the experiment 100 times: Make a matlab program, where 30 
% samples are drawn from a Gaussian distribution with a mean of 1.68m and a 
% standard deviation of 0.2m
rep = 10000; % number of repetitions
n = 30; % number of samples
p = zeros(1,rep);
for i = 1:rep
    wh = Stdder*randn(1,n)+Mu; % 30 samples created
    Muhat = mean(wh);
    z = (Muhat - Mu)/(Stdder/sqrt(n)); % z-score calculated
    p(i) = 2 * min(normcdf(z,0,1),1 - normcdf(z,0,1)); 
end

% 8.1) With a significance level of alfa = 0.05, how often do we falsely reject
% the NULL hypothesis?
alfa = 0.05;
% every time p < alfa the NULL hypothesis is falsely rejected:
fn = sum(p < 0.05);
% divided by repetitions we get the fraction of false negatives
Pfr = fn/rep

% 8.2) Now draw samples from a distribution with a mean of 1.78m and a
% standard deviation of 0.2m. How often do we falsely fail to reject the
% NULL hypothesis?

% we only have to change a little bit of code and this time we are looking
% for falsely fail to reject. That is when p > alfa as opposed to before
mynew = 1.78; % new mean for random samples
for i = 1:rep
    wh = Stdder*randn(1,n)+mynew;
    Muhat = mean(wh);
    z = (Muhat - Mu)/(Stdder/sqrt(n)); % samples are compared to old mean
    p(i) = 2 * min(normcdf(z,0,1),1 - normcdf(z,0,1));
end
fp = sum(p > 0.05);
Pffr = fp/rep
