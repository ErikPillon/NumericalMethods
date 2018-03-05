function [E] = mesh(lx,ly,nx,ny,M)

for e=1:nx*(ny-1)
    if M(e,1)!=lx
       E(e,:)=(e,e+1,e+nx+1,e+nx);
end
end

