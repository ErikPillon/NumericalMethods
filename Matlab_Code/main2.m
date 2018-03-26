clc; clear all; close all;
% this is the main file for the electric part

%% discretization of the domain and building of the mesh for electric part
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
% we have to define the two differents electrical conductivity of the
% materials
k1 = 9.93e6;
k2 = 2.5e5;

%% Value of the potentials at the extrema for the Dirichlet conditions
U0 = 0;
DeltaU = 100;

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
    k = k1;
    % the following if statement serves for checking if we have to use the
    % conductivity of the crucible or of the electrode
    if Ele(e,2)<0.02 | Ele(e,2)>0.42 
        k = k2;
    end
    Contribution = k*gai_gaj*J;
    % update the global matrix values; it will recollect the global number
    % from the local number and the element e
    Interaction = Update(Interaction, Elem, e, Contribution);
end

%% now we have to evaluate the right hand side of the equation
rhs = zeros(N_points, 1);
% as boundary effect we only have to keep fixed the values at the boundary
% of the electrods
n_elements_bottom = 0.04/dx;
rhs(1:n_elements_bottom) = U0;
n_elements_top = 0.02/dx;
rhs(end-n_elements_top,end) = DeltaU;
% now we have to modify the matrix in a way that they must be kept fixed to
% that value
Total = Interaction+Bound;
for i = 1:n_elements_bottom = 0.04/dx;
    Total(i,:) = zeros(1,N_elements);
    Total(i,i) = 1;
end

for i = N_elements-n_elements_bottom:n_elements_bottom
    Total(i,:) = zeros(1,N_elements);
    Total(i,i) = 1;
end

U = (Total)\rhs;




