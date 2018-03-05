function [b_Ele,N] = b_elements(lx,ly,nx,ny)
% M: matrix of [x,y] components of the point
% N: number of points generated

x=0, y=0; %initialize all the variables to zero
i=0; %set counter
dy=ly/ny; dx=lx/nx;

% bottom points
while x < lx
    i = i+1;
    b_Ele(i,:) = [i,i+1];
    x = x+dx;
    i = i+1;
end

% right-boundary point
while y < ly
    i = i+1;
    b_Ele(i,:) = [nx*i,(nx+1)*i];
    y = y+dy;
end

% top points
while x > 0
    i = i+1;
    b_Ele(i,:) = [i-1,i];
    x = x-dx;
end