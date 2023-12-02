function [central_difference1,central_difference2] = two_scale_central_difference_accurate(U,N,V,delta)
    h=1/N;
    central_difference1 = zeros(N-1,N-1);
    central_difference2 = zeros(N-1,N-1);
    for i=2:N
        for j=2:N
            x=(j-1)*h;
            y=(i-1)*h;
            direction = V{i-1,j-1};
            central_difference1(i-1,j-1) =1/(3*delta^2*(direction(1,1)^2+direction(1,2)^2))*(-interp_accurate(U,N,x+direction(1,1)*delta,y+direction(1,2)*delta)-interp_accurate(U,N,x-direction(1,1)*delta,y-direction(1,2)*delta)-30*U(i,j)+16*interp_accurate(U,N,x-direction(1,1)*delta/2,y-direction(1,2)*delta/2)+16*interp_accurate(U,N,x+direction(1,1)*delta/2,y+direction(1,2)*delta/2));
            direction(1,1)=direction(2,1);
            direction(1,2)=direction(2,2);
            central_difference2(i-1,j-1) =1/(3*delta^2*(direction(1,1)^2+direction(1,2)^2))*(-interp_accurate(U,N,x+direction(1,1)*delta,y+direction(1,2)*delta)-interp_accurate(U,N,x-direction(1,1)*delta,y-direction(1,2)*delta)-30*U(i,j)+16*interp_accurate(U,N,x-direction(1,1)*delta/2,y-direction(1,2)*delta/2)+16*interp_accurate(U,N,x+direction(1,1)*delta/2,y+direction(1,2)*delta/2));
        end
    end
end