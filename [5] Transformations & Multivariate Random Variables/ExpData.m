function x = ExpData(lambda,N)
%% Function that creates N values of exponential distributed 
% data points
% x = ExpData(lambda,N), inputs lambda.
% Returns random data x

x = -log(1-rand(1,N))./lambda;


%% x er iid
end

