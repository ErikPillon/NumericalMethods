function [E] = mesh(lx,ly,nx,ny,M)
e = 1;
for i = 1:nx*(ny-1)
    e =i;
    if M(e,1) != lx
       E(e,:) = (e,e+1,e+nx+1,e+nx);
       e=e+1;
    end
end

end

