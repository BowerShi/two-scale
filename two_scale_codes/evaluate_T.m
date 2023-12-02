function min_value=evaluate_T(U,N,delta,theta,i,j,u_increase)
U(i,j) = U(i,j) +u_increase;
[S_theta_perp, D] = caculate_S_theta_perp(theta);
h=1/N;
x = (j-1)*h;
y = (i-1)*h;
S_theta_perp_modyfied = modify_Vectors(S_theta_perp,D,delta,x,y);
temp = zeros(1,D);
for k=1:D
    direction = S_theta_perp_modyfied{k};
    cd1=1/(delta^2*(direction(1,1)^2+direction(1,2)^2))*(interp(U,N,x+direction(1,1)*delta,y+direction(1,2)*delta)+interp(U,N,x-direction(1,1)*delta,y-direction(1,2)*delta)-2*U(i,j));
    cd2=1/(delta^2*(direction(2,1)^2+direction(2,2)^2))*(interp(U,N,x+direction(2,1)*delta,y+direction(2,2)*delta)+interp(U,N,x-direction(2,1)*delta,y-direction(2,2)*delta)-2*U(i,j));
    temp(k) = matplus(cd1)*matplus(cd2)-(matminus(cd1)+matminus(cd2));
end
min_value = min(temp);
end