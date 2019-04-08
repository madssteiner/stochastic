%% ETSMP Comparison of two datasets

Before=[100 84 82 70 88 62 91 35 75 81];
After=[45 91 54 67 95 53 85 95 62 74];

%% Estimate the mean and variance
mean(Before);
MeanBefore=sum(Before)./length(Before);
mean(After);
MeanAfter=sum(After)./length(After);
var(Before);
varBefore=1/(length(Before)-1).*sum((Before-MeanBefore).^2);
var(After);
varAfter=1/(length(After)-1).*sum((After-MeanAfter).^2);

%% Find delta
Delta=After-Before;
mean(Delta);
MeanDelta=sum(Delta)./length(Delta);


%% Formulate Null and alternative hypothesis
% H0: Delta = 0
% H1: Delta != 0

%% Statistical test
%% I would use Paired test t-test, as the variance is unknown, and the data is paired

%% The test statistics
%% estimeret standard afvigelse
sd= sqrt(1/(length(Delta)-1).*sum((Delta-MeanDelta).^2));

% test statistics t:
t=(MeanDelta-0)/(sd/sqrt(length(Delta)));

%% the test should be paired

%% Rejection of Hypothesis?
% calculation of p-value
p=2*(1-tcdf(abs(t),length(Delta)-1))

%% As the p-value is above 0.05, we cannot reject the Null hypothesis.

%% Confidence interval
delta_minus=MeanDelta-tinv(0.975,length(Delta)-1)*sd/sqrt(length(Delta));
delta_plus=MeanDelta+tinv(0.975,length(Delta)-1)*sd/sqrt(length(Delta));


%% The difference in the population means are expected to be the mean values of delta
MeanDelta;

%% Unpaired test, this test is NOT the correct one to use.

%% As we have very little data for an unpaired test, we do not expect to reject the Null hypothesis.
%Unpaired test for the same data
%% pooled standard derivation
s=sqrt(1/(length(After)+length(Before)-2)*((length(Before)-1)*varBefore+(length(After)-1)*varAfter));
t_unpaired=(MeanBefore-MeanAfter)/(s*sqrt(1/length(After)+1/length(Before)));

p_unpaired=2*(1-tcdf(abs(t_unpaired),length(After)+length(Before)-2));  %p = 0.233

%% since the p-value is 0.2329 and thus above 0.05, we cannot reject the hypothesis. The conclusion is in this case the same as for the paired test.