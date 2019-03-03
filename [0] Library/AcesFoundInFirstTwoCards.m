function AcesIsFound = AcesFoundInFirstTwoCards( StopPoints, PlayerPoints, PointsDrawn )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if PlayerPoints + 10 >= StopPoints && PlayerPoints <= 11 && isempty(find(PointsDrawn == 1, 1)) ~= 1
  AcesIsFound = 1;
else 
  AcesIsFound = 0;
end

