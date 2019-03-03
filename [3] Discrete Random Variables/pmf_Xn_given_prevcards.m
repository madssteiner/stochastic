function pmf_Xn_given_prevcards=pmf_Xn_given_prevcards(drawncards)
% Calculate the pmf of the nth card wtih the previous drawn cardvalues as input

Number_drawncards=length(drawncards);

card_values=[1:10,10,10,10,1:10,10,10,10,1:10,10,10,10,1:10,10,10,10];
[countvalue value]=hist(card_values);
for n=1:Number_drawncards
    drawncard_value=drawncards(n);
    countvalue(drawncard_value)=countvalue(drawncard_value)-1;
end
pmf_Xn_given_prevcards=countvalue./sum(countvalue);
stem(1:10,pmf_Xn_given_prevcards)
end