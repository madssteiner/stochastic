%% Assignment 13, Linear Regression
% Løsning til udvalgte opgaver

close all

n=length(t);
t=[-10    -5     0     5    10    15    20    25    30    35    40    45    50    55    60    65    70    75];
x=[-0.1178   -0.0480   -0.0109    0.0561    0.0880    0.1598    0.2148    0.2842    0.2961    0.3072    0.3832    0.4771    0.4786 0.01 0.03 0.05 -0.01 0.0];
%% Opgave 1, 3, 4: Plot data
figure(1)
tbar=sum(t)/n;
xbar=sum(x)/n;
SSDt=sum((t-tbar).^2);
SSDx=sum((x-xbar).^2);
SPD=sum((x-xbar).*(t-tbar));
beta=SPD/SSDt;
gamma=xbar-beta*tbar;
tplot=linspace(min(t),max(t),2);
xplot=beta*tplot+gamma;
plot(t,x,'x','LineWidth',2)
grid
set(gca,'LineWidth',2)
hold on
ylabel('Current')
xlabel('Voltage')
title('Measurenments of Currents')
plot(tplot,xplot,'LineWidth',2)

%% Opgave 2: Hypothesis test for Ohms Law, beta=slope
% H0: beta=1/100
% H1: beta =! 1/100


%% Opgave 6: Residual plot
figure(2)
hold off
r=x-(gamma+beta*t);% Residuals
%xi=gamma+beta*t
plot(t,r,'x','LineWidth',2)
grid
set(gca,'LineWidth',2)
hold on
ylabel('Current')
xlabel('Voltage')
title('Residual til Lineær fitning')
hold on

%% Opgave 5: Rejection of NULL hypothesis
%% Calculation of t:
s_r=sqrt(1/(n-2)*sum(r.^2));
t=(beta- 1/100)/(s_r*sqrt(1/SSDt));
p=2*(1-tcdf(abs(t),n-2));
%% if p<0.05, we reject the hypothesis. p=1e-4, we reject thus the NULL hypothesis.

%% Opgave 8: Konfidens interval
SSDt=sum((t-tbar).^2);
SSDx=sum((x-xbar).^2);
SPD=sum((x-xbar).*(t-tbar));
s2r=(SSDx-SPD^2/SSDt)/(n-2);
t0=tinv(0.975,n-2);

nedre=beta-t0*sqrt(s2r/SSDt);
oevre=beta+t0*sqrt(s2r/SSDt);

%% Opgave 10:
% Yes, outliers after 50V, the resistor changes resistance after 50V.