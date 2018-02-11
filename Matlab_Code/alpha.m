function [alfa, dalfa_u, dalfa_v] = alpha(u,v)
% u, v: nodes in which the function must be evaluated

alfa(1)=1/4*(1-u).*(1-v);
alfa(2)=1/4*(1+u).*(1-v);
alfa(3)=1/4*(1+u).*(1+v);
alfa(4)=1/4*(1-u).*(1+v);

%evaluation of the derivative respect to u
dalfa_u(1)=-1/4.*(1-v);
dalfa_u(2)=1/4.*(1-v);
dalfa_u(3)=1/4.*(1+v);
dalfa_u(4)=-1/4.*(1+v);  

%evaluation of the derivative respect to v
dalfa_v(1)=-1/4.*(1-u);
dalfa_v(2)=-1/4.*(1+u);
dalfa_v(3)=1/4.*(1+u);
dalfa_v(4)=1/4.*(1-u);

end