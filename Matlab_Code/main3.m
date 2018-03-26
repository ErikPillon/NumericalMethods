% this is the main file for the coupled problem.
% It is essentially the combiantion of the two previuos programs

clc; clear all; close all;
%% first we start with the electric part

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
% Electrical conductivity constants
k1 = 9.93e6; k2 = 2.5e5;
% thermal conductivity
h = 80,2; % W/(m* K)
% temperature of the environment is kept fixed at 300K
Tr = 300;

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

% -------------------------------------------------------------------------
%% from here we solve the thermal part

%% discretization of the domain and building of the mesh for the thermal part
% initialization of the variables lx, ly, nx, ny
lx = 0.3; ly = 0.5; nx = 10; ny = 10; 
dx = lx/nx; dy = ly/ny;

% creation of the points and of the mesh
[M, N_points] = points(lx,ly,nx,ny);
[Elem, N_elements] = mesh_domain(lx,ly,nx,ny,M);

% initialize the rhs
% at the ened the system to solve will be (A+B)*T=rhs
rhs = zeros(N_points,1);

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
    Contribution = h*gai_gaj*J;
    % update the global matrix values; it will recollect the global number
    % from the local number and the element e
    Interaction = Update(Interaction, Elem, e, Contribution);
    % we have to take into account the heat generated by the electric
    % problem, so for each element we have to evaluate the heat through the
    % Joule effect
    Q = Joule(Elem, e);
    A = heat_contribution(M, Elem, e, Q, dx, u);
    Contribution = A*J;
    rhs = Update_rhs(rhs, Elem, e, Contribution);
end

% from the original discretization we extract the boundary elements
[b_Elem, N_b_elements] = b_elements_thermal(lx,ly,nx,ny);
% this matrix must bel filled with the terms given by the boundary effects
Bound = zeros(N_points);
for f = 1:N_b_elements
    [Jac] = jacobian(M, b_Elem, f);
    J = det(Jac);
    %% evaluation of the 1 dimensional integral
    % evaluation of the 2x2 matrix ai_aj
    % here we will need the gauss points
    ai_aj = integral_1D(M, b_Elem, f, dx, u, w);
    Contribution_boundary = h*ai_aj*J;
    % update the global matrix values; it will recollect the global number
    % from the local number and the element e
    Bound = Update_boundary(Bound, b_Elem, f, Contribution_boundary);
end

%% construction of the right hand side of the equation
% the for loop is for the Neumann condition    
for f = 1:N_b_elements
    [Jac] = jacobian(M, b_Elem, f);
    J = det(Jac);
    %% evaluation of the 1 dimensional integral
    [ai] = neumann_condition(M, b_Elem, f, Tr, dx, u, w);
    Contribution_boundary = h*ai*J;
    % update the global matrix values; it will recollect the global number
    % from the local number and the element e
    rhs = Update_rhs(rhs, b_Elem, f, Contribution_boundary);
end

T = (Interaction+Bound)\rhs;

%% plot of the results
figure
[x,y] = meshgrid(0:dx:lx,0:dy:ly)
mesh(x,y,reshape(T,11,11))
title('Thermal problem solution (non coupled). T=300K')
xlabel('x')
ylabel('y')
zlabel('Temperature')
filename = 'Temperature_result';
print(filename,'-depsc')






