function U=lift_u_all(U,N,f,delta,theta)
for i=2:N
    for j=2:N
        x=(j-1)*1/N;
        y=(i-1)*1/N;
        U(i,j) = lift_u(U,N,i,j,f(x,y),delta,theta);
    end
end
end