function [M] = points( lx,ly,nx,ny)

x=0; %initialize all the variables to zero
y=0;
i=0;
dy=ly/ny;
dx=lx/nx;
% use the loops for both x and y
for y=0:dy:ly
    for x=0;dx;lx
        M(i,:)= [x,y]; %save the point
        i=i+1; %update the counter
    end
end
end

