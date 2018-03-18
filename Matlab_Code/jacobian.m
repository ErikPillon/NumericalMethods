function [Jac] = jacobian(M, E, e)
% -------- INPUT ------------
% M: matrix of the points with x and y coordinates
% E: matrix of the mesh
% e: global number of the element considered
% 
% -------- OUTPUT -----------
% Jac: 2x2 matrix with the values of the jacobian matrix

% we obtain the x and y coordinates of the points involved
x_i = M(E(e,:),1);
y_i = M(E(e,:),2);
% xi and eta points in which evaluate the functions
xi = [-1, 1, 1, -1];
eta = [-1, -1, 1, 1];
% n_elements = number of nodes considered
%              [it can change from a boundary element or an internal
%              element]
n_elements = length(x_i); 

Jac = zeros(2);
for i = 1:n_elements
    [alfa, dalfa_xi, dalfa_eta] = alpha(xi(i),eta(i));
    Jac(1,1) = Jac(1,1) +dalfa_xi(i)*x_i(i); 
    Jac(1,2) = Jac(1,1) +dalfa_xi(i)*y_i(i);
    Jac(2,1) = Jac(1,1) +dalfa_eta(i)*x_i(i);
    Jac(2,2) = Jac(1,1) +dalfa_eta(i)*y_i(i);
end


