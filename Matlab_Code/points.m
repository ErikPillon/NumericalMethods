function [M,N] = points(lx,ly,nx,ny)
% ---   INPUT  ---
% lx, ly : lenghts
% nx, ny : number of points of the discretization
% -----   OUTPUT  ---------
% M: matrix of [x,y] components of the point
% N: number of points generated

x=0, y=0; %initialize all the variables to zero
i=1; %set counter
dy=ly/ny; dx=lx/nx;
% use the loops for both x and y
for y=0:dy:ly
    for x=0:dx:lx
        M(i,:)= [x,y]; %save the point
        i=i+1; %update the counter
    end
end
N = i-1;
end

