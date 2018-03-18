function [B] = integral_1D(M, b_Elem, f, dx, u, w)
% function for evaluating a 1D integral
% --- INPUT  ---
% M      : x,y coordinates of the points
% b_Elem : global matrix of the boundary elements
% f      : global number of the boundary element considered
% dx     : x displacement
% u,w    : Gauss nodes
% --- OUTPUT ---
% B : Term for the updating

B = zeros(2);
r = M(b_Elem(f,1),1);

for i = 1:2
    for j = 1:2
        sum = 0;
        for xi_coord = 1:4
            for eta_coord = 1:4
                [Alpha, dalpha_xi, dalpha_eta] = alpha(u(xi_coord),u(eta_coord));
                % the following is the summation of the inner product
                % alpha_i.alpha_j
                w1 = w(xi_coord);
                w2 = w(eta_coord);
                sum=sum+(Alpha(i)*Alpha(j)+Alpha(i)*Alpha(j))*(r+dx/2+u(xi_coord)*dx)*w1*w2;
            end
        end
        B(i,j) = sum;
    end
end

end
