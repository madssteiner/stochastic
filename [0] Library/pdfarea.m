function [] = pdfarea(x, y, lower, higher, color)
%PDFAREA creates a filled area from a point at x-axis point to another. 
%   x - array
%   y - array
%   lower - number [lowest x-value]
%   higher - number [highest x-value]
%   color - array [r, g, b] from zero to one values, otherwise use load
%   colors from color.mat file in library.

if nargin == 4
    if isempty(lower)
        Hl = area(x,y,'FaceColor',[1, 1, 1]);
        hold on
        index = (x >= -inf) & ( x <= higher);
        H = area(x(index), y(index));
        set(H(1),'FaceColor', "flat");
    else
        Hl = area(x,y,'FaceColor',[1, 1, 1]);
        hold on
        index = (x >= lower) & ( x <= higher);
        H = area(x(index), y(index));
        set(H(1),'FaceColor', "flat");
    end
elseif nargin == 3
    Hl = area(x,y,'FaceColor',[1, 1, 1]);
    hold on
    index = (x >= lower) & ( x <= inf);
    H = area(x(index), y(index));
    set(H(1),'FaceColor', "flat");
else
    if isempty(higher)
        higher = inf;
        Hl = area(x,y,'FaceColor',[1, 1, 1]);
        hold on
        index = (x >= lower) & ( x <= higher);
        H = area(x(index), y(index));
        set(H(1),'FaceColor', color);
    else
        Hl = area(x,y,'FaceColor',[1, 1, 1]);
        hold on
        index = (x >= lower) & ( x <= higher);
        H = area(x(index), y(index));
        set(H(1),'FaceColor', color); 
    end
end

hold off

end

