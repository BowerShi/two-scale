function [central_difference1,central_difference2] = two_scale_central_difference(U,N,V,delta)
    h=1/N;
    central_difference1 = zeros(N-1,N-1);
    central_difference2 = zeros(N-1,N-1);
    for i=2:N
        for j=2:N
            x=(j-1)*h;
            y=(i-1)*h;
            direction = V{i-1,j-1};
            central_difference1(i-1,j-1) =1/(delta^2*(direction(1,1)^2+direction(1,2)^2))*(interp(U,N,x+direction(1,1)*delta,y+direction(1,2)*delta)+interp(U,N,x-direction(1,1)*delta,y-direction(1,2)*delta)-2*U(i,j));
            central_difference2(i-1,j-1) =1/(delta^2*(direction(2,1)^2+direction(2,2)^2))*(interp(U,N,x+direction(2,1)*delta,y+direction(2,2)*delta)+interp(U,N,x-direction(2,1)*delta,y-direction(2,2)*delta)-2*U(i,j));
        end
    end
end