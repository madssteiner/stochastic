function Ebola
%% Group Assignment 2: Ebola example

%Giving the population symptoms and infection
Population=rand(1,1000); %Number of population

for n=1:length(Population)
if Population(n)<=0.2 %Infected and symptoms
    Infected(n)=1;
    Symptoms(n)=1;
elseif 0.2<Population(n) && Population(n)<=0.5 %Symptoms but not infected
    Infected(n)=0;
    Symptoms(n)=1;
elseif Population(n)>0.99 %Infected and no symptoms
    Infected(n)=1;
    Symptoms(n)=0;
else %No symptoms and not infected
    Infected(n)=0;
    Symptoms(n)=0;
end
end


% #1 Infected
Number_Infected=0;
for n=1:length(Infected)
    if Infected(n)==1
        Number_Infected=Number_Infected+1;
    end
end
Pr_Infected=Number_Infected/length(Population)%Probability of beeing infected


% #2 Infected with no symptions
Number_Infected_NoSymptoms=0; %Number of infected with no symptoms
for n=1:length(Population)
    if Infected(n)==1 && Symptoms(n)==0
      Number_Infected_NoSymptoms=Number_Infected_NoSymptoms+1;
    end
end
Pr_NoSymptoms_given_Infected=Number_Infected_NoSymptoms/Number_Infected


% #3 At least one infected of five with symptoms and five without symptoms
% Sorting with (Pinfectec_sym) and without (Pinfected_nosym) symptoms
p=1;
q=1;
for n=1:length(Population)
    if Symptoms(n)==1 %With symptoms
       Pinfected_sym(p)=Infected(n); %Infected (1) or not (0)
       p=p+1;
    else %Without symptoms
        Pinfected_nosym(q)=Infected(n); %Infected (1) or not (0)
        q=q+1;
    end
end

Ninfected=0; %Number of simulations with at least one infected of 2x5 persons
for k=1:100 %Number of simulations
    Ri=randi(p-1,1,5); %Five random numbers up to the number of persons withs symptoms
    Rnoti=randi(q-1,1,5); %Five random numbers up to the number of persons without symptoms
    if isempty(find(Pinfected_sym(Ri)==1,1))==0 %At least one of five persons with symtoms are infected
        Ninfected=Ninfected+1;
    elseif isempty(find(Pinfected_nosym(Rnoti)==1,1))==0 %At least one of five persons without symptoms are infected
        Ninfected=Ninfected+1;
    end
end
Pr_min_1_infected=Ninfected/100 %Probability of at least one infected of 2x5 persons


% #5: Mean number of tests
Total_number_tests=0;
for n=1:100;
Place_Ebola=randi(10); %Ramdon place of infected patient = Number of tested persons neccessary
Total_number_tests=Total_number_tests+Place_Ebola;
end
Mean_number_tests=Total_number_tests/100


% #7: Number of combinations of two patients out of ten
Combinations(1,:)=0; %Combination number one
Combinations(1,1)=1;
Combinations(1,2)=1;
r=2;
for n=1:1000
    Combinations(r,:)=0; %Combination number r
    N=randi(10,1,2);
    Match=0;
    if N(1)~=N(2) %The two random numbers (places in the row) should be different
        Combinations(r,N(1))=1;
        Combinations(r,N(2))=1;
        for k=1:r-1
            if Match==0 && Combinations(k,N(1))==Combinations(r,N(1)) && Combinations(k,N(2))==Combinations(r,N(2))
                Match=1; % The combination had occured allready (not a new combination)
            end
        end
        if Match==0
        r=r+1;
    end
    end  
end
Number_of_combinations=r-1


% #8: Selecting two infected out of ten
Counter_match=0;
Counter_trial=0;
N1=randi(10);
for n=1:10000
    N=randi(10,1,2);
    if N(1)~=N(2)%The places in the row should be different
        Counter_trial=Counter_trial+1;
        if Combinations(N1,N(1))==1 && Combinations(N1,N(2))==1 %We have selected the two infected pesons
            Counter_match=Counter_match+1;
        end
    end
end
Pr_match=Counter_match/Counter_trial
        
   
% #10: Hospital outbreak
days100=0;
N_tot_sim=200;
for N_sim=1:N_tot_sim    
    N=randi(length(Population),1,10); %Ten random selected persons from the population
    p=0;
    Infected_hosp=0;
    for k=1:10
        if Infected(N(k))==1
            p=p+1;
            Infected_hosp(p)=1; %The infected people of the selection
        end
    end

    for day=1:17
        Infected_new=0;
        Number_infected=length(Infected_hosp); %The total number of infected
        if Number_infected<100
            for n=1:Number_infected
                Infected_new=randi(2)-1;
                if Infected_new==1 %Every infected infects 0.5 new person pr. day
                    Infected_hosp(length(Infected_hosp)+1)=1; %A new infected
                end
            end
            days=day;
            Number_infected=length(Infected_hosp); %The total number of infected on day "day"
        end
    end
    days100=days100+days;
    days100;
end
Mean_days100=days100/N_tot_sim %Mean number of days to infect more than 100 people


% #11: 10 days hospital outbreak
N100=0;
for N_sim=1:N_tot_sim    
    N=randi(length(Population),1,10); %Ten random selected persons from the population
    p=0;
    Infected_hosp=0;
    for k=1:10
        if Infected(N(k))==1
            p=p+1;
            Infected_hosp(p)=1; %The infected people of the selection
        end
    end
    
    for day=1:10
        Infected_new=0;
        Number_infected=length(Infected_hosp); %The total number of infected
        for n=1:Number_infected
           Infected_new=randi(2)-1;
           if Infected_new==1 %Every infected infects 0.5 new person pr. day
               Infected_hosp(length(Infected_hosp)+1)=1; %A new infected
           end
        end
        Number_infected=length(Infected_hosp); %The total number of infected on day "day"
    end
    if Number_infected>=100
        N100=N100+1; %Number of times with more than 100 infected in 10 days
    end 
end
Pr_100infected=N100/N_tot_sim %Probbility of more than 100 infected in 10 days
