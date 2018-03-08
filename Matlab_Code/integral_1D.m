function [B] = integral_1D(M, b_elem, f, dx, u, w)  

B = zeros(2);
r = M(b_elem(r,1),1);

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
