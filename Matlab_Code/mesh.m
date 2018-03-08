function [E,e] = mesh(lx,ly,nx,ny,M)
% -----   INPUT   ----------
% lx, ly : characteristica lengths of the problem
% nx, ny : number of points in each direction
% M      : Matrix in which are stored the x and y coordinates of the points 
% -----   OUTPUT   ---------
% E : Matrix in which are stored all the points of each element
% e : number of elements



dx = lx/nx; dy = ly/ny;
e = 1;
x=0; y=0;
for iter=1:length(M)
    if M(iter,1)<lx & M(iter,2)<ly
        E(e,:) = [iter,iter+1,iter+1+nx,iter+nx];
        e = e+1;
    end
end
% we want to return the number of the elements we've generated
e = length(E);


