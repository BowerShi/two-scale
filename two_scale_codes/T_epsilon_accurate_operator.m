function [V,TU] = T_epsilon_accurate_operator(U,N,delta,theta)
h=1/N;
V=cell(N-1,N-1);
TU=zeros(N-1,N-1);
[S_theta_perp, D] = caculate_S_theta_perp(theta);
for i=2:N
    for j=2:N
        x = (j-1)*h;
        y = (i-1)*h;
        S_theta_perp_modyfied = modify_Vectors(S_theta_perp,D,delta,x,y);
        temp = zeros(1,D);
        for k=1:D
            direction = S_theta_perp_modyfied{k};
            cd1=1/(3*delta^2*(direction(1,1)^2+direction(1,2)^2))*(-interp_accurate(U,N,x+direction(1,1)*delta,y+direction(1,2)*delta)-interp_accurate(U,N,x-direction(1,1)*delta,y-direction(1,2)*delta)-30*U(i,j)+16*interp_accurate(U,N,x-direction(1,1)*delta/2,y-direction(1,2)*delta/2)+16*interp_accurate(U,N,x+direction(1,1)*delta/2,y+direction(1,2)*delta/2));
            direction(1,1)=direction(2,1);
            direction(1,2)=direction(2,2);
            cd2=1/(3*delta^2*(direction(1,1)^2+direction(1,2)^2))*(-interp_accurate(U,N,x+direction(1,1)*delta,y+direction(1,2)*delta)-interp_accurate(U,N,x-direction(1,1)*delta,y-direction(1,2)*delta)-30*U(i,j)+16*interp_accurate(U,N,x-direction(1,1)*delta/2,y-direction(1,2)*delta/2)+16*interp_accurate(U,N,x+direction(1,1)*delta/2,y+direction(1,2)*delta/2));
            temp(k) = matplus(cd1)*matplus(cd2)-(matminus(cd1)+matminus(cd2));
        end
        [min_value,min_pos] = min(temp);
        TU(i-1,j-1) = min_value;
        V{i-1,j-1} = S_theta_perp_modyfied{min_pos};
    end
end
end

