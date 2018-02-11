% this is the main file
% in the following we describe step-by-step all the procedure for solving
% the thermal part of the problem

%% discretization of the domain and building of the mesh
% initialization of the variables lx, ly, nx, ny

[M] = points(lx,ly,nx,ny);
[E] = mesh(lx,ly,nx,ny,M);




