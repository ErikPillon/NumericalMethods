% in the following we describe step-by-step all the procedure for solving
% the thermal part of the problem

%% discretization of the domain and building of the mesh for the thermal part
% initialization of the variables lx, ly, nx, ny
% THESE VALUES MUST BE CHANGED!
[lx, ly, nx, ny] = [100, 100, 100, 100]; 

% creation of the points and of the mesh
[M, N_points] = points(lx,ly,nx,ny);
[Elements, N_elements] = mesh(lx,ly,nx,ny,M);
[b_Elements, N_b_elements] = b_elements(lx,ly,nx,ny,M);

%% initialization of the points for the gauss quadrature formula
w=[0.347855 0.652145 0.652145 0.347855];
u=[-0.861136 -0.339981 0.339981 0.861136];

%% evaluation of the integral on the variuos elements of the basis
for e = 1:N_elements
    % creation of the Jacobian matrix
    [Jac] = jacobian(M, E, e); 
    J = det(Jac); %jacobian
    for i = 1:4
        for j=1:4
            % evaluation of the 4x4 matrix 
            % here we will need the gauss points
        end
    end
    % update the global matrix values
    
    % evaluate the surface terms
    
    % update the global matrix
    
end
    
for f = 1:N_b_elements
    % evaluation of the surface contribution
    
    % update the right hand side of the equation term
end

