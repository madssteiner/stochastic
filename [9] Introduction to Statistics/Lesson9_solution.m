%Fake data example
close all
clear all
%% 1)
% Yes they ar e i.i.d.

%% 2)
% Yes it is.

%% 3)
x1=sqrt(2)*randn(1,100)+7;
hold off
plot(x1)
hold on
%% 4)
% The population is all realisations of the process X(n)

%% 5) Sample mean
SampleMeanX=1/length(x1)*sum(x1)
mean(x1)

%% 7) sample variance
SampleVarianceX=1/(length(x1)-1)*sum((x1-SampleMeanX).^2)
var(x1)

%% 9) z-score
z=(SampleMeanX-7)/(sqrt(2)/sqrt(length(x1)))

%% 10) Confidence interval
Lower_bound=SampleMeanX-norminv(0.975)*sqrt(2)/sqrt(length(x1))
upper_bound=SampleMeanX+norminv(0.975)*sqrt(2)/sqrt(length(x1))
hold on
plot(ones(1,length(x1)).*Lower_bound)
hold on
plot(ones(1,length(x1)).*upper_bound)

%% 12 sample size
B=norminv(0.975)*sqrt(2)/sqrt(length(x1));

size_n_min=(norminv(0.975)*sqrt(2)/B)^2

%% 13
for nn=1:300
x1=sqrt(2)*randn(1,100)+7;
meansX(nn)=mean(x1);
end
figure(2)
hist(meansX)

%% 14
for nn=1:300
x1=4*rand(1,100)+5;
meansX(nn)=mean(x1);
end
figure(3)
hist(meansX)