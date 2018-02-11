% this is the main file
% in the following we describe step-by-step all the procedure for solving
% the thermal part of the problem

%% discretization of the domain and building of the mesh
% initialization of the variables lx, ly, nx, ny

[M] = points(lx,ly,nx,ny);
[E] = mesh(lx,ly,nx,ny,M);

%% initialization of the points for the gauss quadrature
w=[0.347855 0.652145 0.652145 0.347855];
u=[-0.861136 -0.339981 0.339981 0.861136];

%% evaluation of the integral on the variuos elements of the basis
for e=1:nx*ny
	%creation of the alpha coefficients
	[alfa, dalfa_u, dalfa_v] = alpha(u,v)
    % creation of the Jacobian matrix
    [Jac] = jacobian(alpha,M); 
    J = det(Jac); %jacobian
    J_1 = inv(Jac);
    grad_alpha = J_1*[dalfa_u;dalfa_v];
end
    

