function [b_Ele,N] = b_elements_thermal(lx,ly,nx,ny)
% -------   OUTPUT     -----------
% b_Ele: matrix of the boundary elements  
% N    : number of boundary elements generated

% for what concerns the thermal problem, we are putting Neumann boundary
% conditions on the top edge only, so we focus only on that edge
y = ly; 
dx = lx/nx;

i = 1+(nx+1)*ny; % we want to start with the top-left point
f = 1;
for x=0:dx:lx-dx
    b_Ele(f,:) = [i,i+1];
    i = i+1;
    f=f+1;
end
% total number of boundary elements
N = length(b_Ele); 
