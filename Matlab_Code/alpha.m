function [alfa, dalfa_xi, dalfa_eta] = alpha(xi,eta)
% -------- INPUT ------------
% xi, eta: nodes in which the function must be evaluated
%          - they can be also vector values
% 
% -------- OUTPUT -----------
% alfa:      4x1 vector with the values of the four alfas evaluated at (xi,eta)
% dalfa_xi:  4x1 vector of the partial derivatives of alfas wrt xi evaluated
%            at (xi,eta)
% dalfa_eta: 4x1 vector of the partial derivatives of alfas wrt eta evaluated
%            at (xi,eta)

% alfa functions 
alfa(1,:) = 1/4*(1-xi).*(1-eta);
alfa(2,:) = 1/4*(1+xi).*(1-eta);
alfa(3,:) = 1/4*(1+xi).*(1+eta);
alfa(4,:) = 1/4*(1-xi).*(1+eta);

% evaluation of the derivative respect to u
dalfa_xi(1,:) = -1/4.*(1-eta);
dalfa_xi(2,:) = 1/4.*(1-eta);
dalfa_xi(3,:) = 1/4.*(1+eta);
dalfa_xi(4,:) = -1/4.*(1+eta);  

% evaluation of the derivative respect to v
dalfa_eta(1,:) = -1/4.*(1-xi);
dalfa_eta(2,:) = -1/4.*(1+xi);
dalfa_eta(3,:) = 1/4.*(1+xi);
dalfa_eta(4,:) = 1/4.*(1-xi);
end