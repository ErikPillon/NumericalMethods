function [M] = points( lx,ly,nx,ny)

x=0,y=0,i=0;
dy=ly/ny;
dx=lx/nx;
for y=0:dy:ly
    for x=0;dx;lx
        M(i,:)= [x,y];
      
        i=i+1;
    end
    
  
end
end

