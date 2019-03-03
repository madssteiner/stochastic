function  cards  = shufflecards()
%This function returns a shuffled deck of card.
%The function returns a struct that contains two attributes. name and value
%
%Example of use:
%cards  = shufflecards()
%cards(1).name
%cards(1).value

%assign value to each card
card_values=[1:10,10,10,10,1:10,10,10,10,1:10,10,10,10,1:10,10,10,10]';
card_name=[
    'Ace of Hearts   ';'Two of Hearts   ';'Three of Hearts ';...
    'Four of Hearts  ';'Five of Hearts  ';'Six of Hearts   ';'Seven of Hearts ';...
    'Eight of Hearts ';'Nine of Hearts  ';'Ten of Hearts   ';...
    'Knave of Hearts ';'Queen of Hearts ';'King of Hearts  ';...
    'Ace of Tiles    ';'Two of Tiles    ';'Three of Tiles  ';...
    'Four of Tiles   ';'Five of Tiles   ';'Six of Tiles    ';'Seven of Tiles  ';...
    'Eight of Tiles  ';'Nine of Tiles   ';'Ten of Tiles    ';...
    'K of Tiles  ';'Queen of Tiles  ';'King of Tiles   ';...
    'Ace of Clovers  ';'Two of Clovers  ';'Three of Clovers';...
    'Four of Clovers ';'Five of Clovers ';'Six of Clovers  ';'Seven of Clovers';...
    'Eight of Clovers';'Nine of Clovers ';'Ten of Clovers  ';...
    'Jack of Clovers ';'Queen of Clovers';'King of Clovers ';...
    'Ace of Pikes    ';'Two of Pikes    ';'Three of Pikes  ';...
    'Four of Pikes   ';'Five of Pikes   ';'Six of Pikes    ';'Seven of Pikes  ';...
    'Eight of Tiles  ';'Nine of Pikes   ';'Ten of Pikes    ';...
    'Jack of Pikes   ';'Queen of Pikes  ';'King of Pikes   '
    ];

Card_index=randperm(52);%makes random shuffled index list of cards

for n=1:length(Card_index)
    cards(n).name=card_name(Card_index(n),:);
    cards(n).value=card_values(Card_index(n));
end