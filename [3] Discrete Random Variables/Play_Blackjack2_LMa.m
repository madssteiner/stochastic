function  Play_Blackjack2
%This function playes blackjack (LMa version 100918)


%% Question 1
games_number=10000;%Number of simulations (plays)

Number_cardvalue(1:10)=0;%Count number of times getting the different cardvalues

for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    Number_cardvalue(cards(1).value)=Number_cardvalue(cards(1).value)+1;%Count number of times getting the different cardcalues in the first draw
end   
pmf1(1:10)=Number_cardvalue()/games_number%The pmf of the cardvalue for the first draw
stem(1:10,pmf1)


%% Question 2
Sum=0;
for value=1:10
   Sum=value*Number_cardvalue(value)+Sum;
end
Mean_firstcard=Sum/games_number


%% Question 3
Number_ace_first=0;%Count games with ace in first draw
Number_cardvalue(1:10)=0;
for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    if cards(1).value==1%%Ace in first draw
        Number_ace_first=Number_ace_first+1;
        Number_cardvalue(cards(2).value)=Number_cardvalue(cards(2).value)+1;%Count number of times getting the different cardcalues in the second draw
    end   
end
Number_ace_first
pmf2(1:10)=Number_cardvalue()/Number_ace_first%The pmf of the cardvalue for the second draw given ace in first draw
stem(1:10,pmf2)


%% Question 4
Number_ace_first(1:10)=0;%Count games with ace in first draw
Number_cardvalue(1:10)=0;
for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    Number_cardvalue(cards(2).value)=Number_cardvalue(cards(2).value)+1;%Counts number of times getting the different cardvalues in second draw
    if cards(1).value==10%%10-value in first draw
        Number_ace_first(cards(2).value)=Number_ace_first(cards(2).value)+1;%Count number of times getting ace in first draw when cards(2).value in second draw
    end   
end
for value=1:10
    pr3(value)=Number_ace_first(value)/Number_cardvalue(value);%The probabilities of ace in first draw when for second draw
end
pr3
stem(1:10,pr3)


%% Question 6+7
% Calculate the meanvalue of the nth card then the first n-1 cards (drawncards) are known
drawncards=[1,2,10,10,1,3,7,7];% The cards allready drawn
pxn=pmf_Xn_given_prevcards(drawncards)% The pmf for the nth card drawn given the knowledges of the first n-1 cards
Mean_Xn=sum((1:10).*(pxn))% The mean value of the nth card drawn

