function  Play_Blackjack
%This function playes blackjack (LMa version 290817)

%% Question 1 and 3

games_number=10000;%Number of simulations (plays)

Number_ace_first=0;%Count number of times getting an ace in first draw

for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    
    if cards(1).value==1
        Number_ace_first=Number_ace_first+1;
    end
end

%% Estimated chance of getting an ace first
Est_Ace_first_card=Number_ace_first/games_number

%% Question 2 and 3

games_number=10000;

Number_ace_first_ten_second=0;

for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    
    if cards(1).value==1
        if cards(2).value==10
            Number_ace_first_ten_second=Number_ace_first_ten_second+1;
        end
    end
end
Est_Ace_first_then_ten_card=Number_ace_first_ten_second/games_number


%% Question 4

games_number=10000;

blackjack_two_cards=0;

for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    
    if cards(1).value==1;
        if cards(2).value==10;
            blackjack_two_cards=blackjack_two_cards+1;
        end
    else if cards(1).value==10;
            if cards(2).value==1;
                blackjack_two_cards=blackjack_two_cards+1;
            end
        end
    end
end
Est_blackjack_two_cards=blackjack_two_cards/games_number

%% Question 5: Risk of busting drawing three cards
games_number=10000;

bust_number=0;

for n=1:games_number
    cards  = shufflecards();%New shuffling of cards
    
    if cards(1).value+cards(2).value+cards(3).value>21
        bust_number=bust_number+1;
    end
end
est_risk_of_bust= bust_number/games_number


%% Question 6 and 7: Strategy for player
games_number=1000;
stop_at=12;

for nn=1:11
    values_from_player=[];
    for n=1:games_number
        cards  = shufflecards();%New shuffling of cards
        player_points=0;
        drawvalues=[cards(1).value,cards(2).value];
        player_points=cards(1).value+cards(2).value;
        if player_points+10>=stop_at && player_points<=11 && isempty(find(drawvalues==1, 1))~= 1  %Aces in first 2 draws
            player_points=player_points+10; % If ace present
        end
        
        counter=3;
        while(player_points<stop_at)
            drawvalues=[drawvalues, cards(counter).value];
            
            player_points=player_points+cards(counter).value;
            counter=counter+1;
            if player_points+10>=stop_at && player_points<=11 && isempty(find(drawvalues==1, 1))~= 1  %Aces in drawn cards
                player_points=player_points+10; % If ace present
            end
        end
        values_from_player=[values_from_player,player_points];
    end
    risk_of_bust_strategy(nn)=length(find(values_from_player>21))/games_number
    
    stop_at=stop_at+1;
end
%risk_of_bust_strategy %% value of the risk at busting at different stop values.


%% Question 8: Playing blackjack
games_number=1000;

stop_at=12;

for nn=1:11
    for n=1:games_number
        cards  = shufflecards();%New shuffling of cards
        player_points=0;
        drawvalues=[cards(1).value,cards(2).value];
        player_points=cards(1).value+cards(2).value;
        if player_points+10>=stop_at && player_points<=11 && isempty(find(drawvalues==1, 1))~= 1  %Aces in first 2 draws
            player_points=player_points+10; % If ace present
        end
        
        counter=3; %counts the number cards in the deck
        while(player_points<stop_at)%Draw cards until player stops.
            drawvalues=[drawvalues, cards(counter).value];
            
            player_points=player_points+cards(counter).value;
            counter=counter+1;
            if player_points+10>=stop_at && player_points<11 && isempty(find(drawvalues==1, 1))~= 1  %Aces in drawn cards
                player_points=player_points+10; % If ace present
            end
            
        end
        %% Bust risk for player
        
        if player_points>21
            game_score(n)=0;
        else
            dealer_points=0;
            drawvalues=[cards(counter).value,cards(counter+1).value];
            dealer_points=cards(counter).value+cards(counter+1).value;
            if dealer_points+10>=player_points && dealer_points<=11 && isempty(find(drawvalues==1, 1))~= 1  %Aces in first 2 draws
                dealer_points=dealer_points+10; % If ace present
            end
            counter=counter+2;
            while(dealer_points<player_points)%Draw cards until dealer is above player.
                drawvalues=[drawvalues, cards(counter).value];
                
                dealer_points=dealer_points+cards(counter).value;
                
                if dealer_points+10>=player_points && dealer_points<=11 && isempty(find(drawvalues==1, 1))~= 1  %Aces in drawn cards
                    dealer_points=dealer_points+10; % If ace present
                end
                counter=counter+1;
            end
            if dealer_points>21
                game_score(n)=1;
            else
                game_score(n)=0;
            end
            
        end
        
    end
    Number_player_win(nn)=sum(game_score)/games_number;
    stop_at=stop_at+1;
end

%chance that the player wins over the dealer
Number_player_win