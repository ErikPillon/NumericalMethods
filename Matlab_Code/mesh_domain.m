function [E,n_Points] = mesh_domain(lx,ly,nx,ny,M)
% this is the algorithm for the discretization of the electrical problem
% part
% -----   INPUT   ----------
% lx, ly : characteristica lengths of the problem
% nx, ny : number of points in each direction
% M      : Matrix in which are stored the x and y coordinates of the points 
% -----   OUTPUT   ---------
% E : Matrix in which are stored all the points of each element
% e : number of elements

dx = lx/nx; dy = ly/ny;
e = 1;
x=0; y=0; % starting point
for iter=1:length(M)
    if M(iter,1)<lx & M(iter,2)<ly
        E(e,:) = [iter,iter+1,iter+1+nx+1,iter+nx+1];
        e = e+1;
    end
end
n_Points = length(E);


