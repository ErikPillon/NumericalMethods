function [b_Ele,N] = b_elements_electric(lx,ly,nx,ny)
% -------   OUTPUT     -----------
% b_Ele: matrix of the boundary elements  
% N    : number of boundary elements generated

% for what concerns the electric problem, we are putting only Dirichlet
% boundary conditions on the top and bottom electrods
N = 1;
b_Ele = zeros(N,2);

