function [M,N] = points_electric()
% -----   OUTPUT  ---------
% M: matrix of [x,y] components of the point
% N: number of points generated

% discretization for the electric part 
dx=0.01;  dy=0.01;  
N = 1; % counter

% bottom electrod
y = 0;
while y <= 0.02
    x = 0;
    while x <= 0.04
        M(N,:) = [x,y];
        x = x+dx;
        N = N+1;
    end
    y = y+dy;
end

% material
while y <= 0.4
    x = 0;
    while x <= 0.1
        M(N,:) = [x,y];
        x = x+dx;
        N = N+1;
    end
    y = y+dy;
end

% top electrod
while y <= 0.1
    x = 0;
    while x <= 0.02
        M(N,:) = [x,y];
        x = x+dx;
        N = N+1;
    end
    y = y+dy;
end
