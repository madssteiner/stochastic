% Solution Group assignment 8 - Girl or boy?

clear,clc
PrG = 0.485; PrB = 1 - PrG;

%% 1. 
% Find the data provided in the link, where the couple has previously
% had two boys (first row)

nB_BB = 33694; % Boy after two boys
nG_BB = 32193; % Girl after two boys

% Task) What numbers would you get in an idealized experiment?

format shortG
N = nB_BB + nG_BB; % total number of newborns
EnB_BB = N*PrB % expected number of boys
EnG_BB = N*PrG % expected number of girls

% Task) What would the statistical model for this experiment be; if we test
% whether the gender of the third child is dependant on the genders of the
% two previous children?

% x ~ binomial(N,PrB), PrG can also be used

% Task) Define the NULL hypothesis and the alternative hypothesis.

% NULL hypothesis:
% estPrB = PrB

% alternative hypothesis:
% estPrB != PrB

% Task) Calculate the p-value based on a Binomial distribution

% expected number is rounded to fit a binomial distribution
diff = abs(nB_BB-round(EnB_BB));
pval = 2*min(binocdf(EnB_BB-diff,N,PrB),1-binocdf(EnB_BB+diff,N,PrB))

% Task) Can you with a significance level of 0.05, reject the NULL hypothesis?

% since pval > 0.05 we cannot reject the NULL hypothesis

% Task) Repeat the hypothesis test based on a normal approximation
z = (nB_BB-EnB_BB)/sqrt(N*PrB*(1-PrB));

pval = 2*min(normcdf(z),1-normcdf(z)) % or 2*(1-normcdf(abs(z)))

% again pval > 0.05 so we cannot reject the NULL hypothesis

% Task) What is the estimator of p, and what is the variance of the estimator

estp = PrB
estpvar = PrB*(1-PrB)/N

% Task) Calculate the confidence intervals for the p value
k = norminv(0.975);

plow = (EnB_BB + k^2/2 - k*sqrt(EnB_BB*(N-EnB_BB)/N + k^2/4))/(N+k^2)
phigh = (EnB_BB + k^2/2 + k*sqrt(EnB_BB*(N-EnB_BB)/N + k^2/4))/(N+k^2)


%% 2.+3. 
% Make a matlab script, which can make the hypothesis test for you
% and test it on all the data from the link

% write observed number of boys and girls
nB = [33694 26868 26741 28561 3615 2703 2708 2583 2644 2636 2646 3148 ...
      454 326 310 288 345 316 283 362 340 279 324 355 315 394 396 470];
nG = [32193 25264 25378 27068 3301 2593 2592 2517 2577 2552 2589 2928 ...
      429 324 309 285 337 292 290 352 302 280 278 348 300 345 360 420];
  
RejectHypothesis = zeros(1,length(nB));
for i = 1:length(nB)
    N = nB(i) + nG(i);
    EnB = N*PrB;
    z = (nB(i)-EnB)/sqrt(N*PrB*(1-PrB));
    pval(i) = 2*min(normcdf(z),1-normcdf(z));
    RejectHypothesis(i) = pval(i) < 0.05;
end

% and yes this can also be done without a for loop