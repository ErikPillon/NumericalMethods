function [A] = double_integral(M, Elem, e, dx, u, w)  

A = zeros(4);
r = M(Elem(e,1),1);

for i = 1:4
    for j = 1:4
        sum = 0;
        for xi_coord = 1:4
            for eta_coord = 1:4
                [Alpha, dalpha_xi, dalpha_eta] = alpha(u(xi_coord),u(eta_coord));
                % the following is the summation of the inner product
                % grad(alpha_i).grad(alpha_j)
                w1 = w(xi_coord);
                w2 = w(eta_coord);
                sum=sum+(dalpha_xi(i)*dalpha_xi(j)+dalpha_eta(i)*dalpha_eta(j))*(r+dx/2+u(xi_coord)*dx)*w1*w2;
            end
        end
        A(i,j) = sum;
    end
end

end
