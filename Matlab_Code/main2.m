clc; clear all; close all;
% this is the main file for the electric part

%% discretization of the domain and building of the mesh for the thermal part
% initialization of the variables lx, ly, nx, ny
dx = 0.01; dy = 0.01;

% creation of the points and of the mesh
[M, N_points] = points_electric();
% the mesh is slightly different because we have to take into account the
% fact that the domanin is different
[Elem, N_elements] = mesh_electric(M);
[b_Elem, N_b_elements] = b_elements_electric(lx,ly,nx,ny);

%% initialization of the points for the gauss quadrature formula
w=[0.347855 0.652145 0.652145 0.347855];
u=[-0.861136 -0.339981 0.339981 0.861136];

%% initialization of the variables
k = 1;
sigma = 1;

%% creation of the big matrices
% this matrix has to be filled with all the terms of interactions between
% the internal elements
Interaction = zeros(N_points);

%% evaluation of the integral on the variuos elements of the basis
for e = 1:N_elements
    % creation of the Jacobian matrix
    [Jac] = jacobian(M, Elem, e); 
    J = det(Jac); %jacobian
    
    %% evaluation of the integral
    % evaluation of the 4x4 matrix gai_gaj
    % here we will need the gauss points
    gai_gaj = double_integral(M, Elem, e, dx, u, w);
    Contribution = sigma*gai_gaj*J;
    % update the global matrix values; it will recollect the global number
    % from the local number and the element e
    Interaction = Update(Interaction, Elem, e, Contribution);
end

% this matrix must bel filled with the terms given by the boundary effects
Bound = zeros(N_points);
for f = 1:N_b_elements
    [Jac] = jacobian(M, Elem, e);
    J = det(Jac);
    %% evaluation of the 1 dimensional integral
    % evaluation of the 2x2 matrix ai_aj
    % here we will need the gauss points
    ai_aj = integral_1D(M, b_Elem, f, dx, u, w);
    Contribution_boundary = k*ai_aj*J;
    % update the global matrix values; it will recollect the global number
    % from the local number and the element e
    Bound = Update_boundary(Bound, b_Elem, f, Contribution_boundary);
end
% for testing we use rhs random
rhs = 1000*rand(N_points,1);
T = (Interaction+Bound)\rhs;



