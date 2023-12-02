function [U,error,active_sets,active_count]=newton_increment_filter(U,N,delta_m,theta_m,delta_a,theta_a,f,tau,t_filter,sigma)
[A_m,TU_m] = calculate_A(U,N,delta_m,theta_m);
[A_a,TU_a] = calculate_A_accurate(U,N,delta_a,theta_a);
TU=zeros(N-1,N-1);
A=sparse((N-1)^2,(N-1)^2);
b=zeros((N-1)^2,1);
h=1/N;
count=0;
active_sets=zeros(1,2);
active_count=1;
for i=1:N-1
    for j=1:N-1
        count=count+1;
        if f((j)*h,(i)*h)>0
            TU(i,j) = TU_m(i,j) + t_filter*f_sigma((TU_a(i,j)-TU_m(i,j))/t_filter,sigma);
            A(count,:) = A_m(count,:) + f_sigma_d((TU_a(i,j)-TU_m(i,j))/t_filter,sigma)*(A_a(count,:)-A_m(count,:));
        else
            TU(i,j) = TU_m(i,j) + t_filter*f_tilde((TU_a(i,j)-TU_m(i,j))/t_filter,sigma);
            A(count,:) = A_m(count,:) + f_tilde_d((TU_a(i,j)-TU_m(i,j))/t_filter,sigma)*(A_a(count,:)-A_m(count,:));
        end
        b(count)=f(j*h,i*h)-TU(i,j);
        if abs((TU_a(i,j)-TU_m(i,j))/t_filter)>1+sigma
            active_sets(active_count,1)=j*h;
            active_sets(active_count,2)=i*h;
            active_count = active_count+1;
        end
    end
end
x0=A\b;
X=zeros((N+1),(N+1));
count=0;
for i=1:N+1
    for j=1:N+1
        if i ~=1 && i~= N+1 && j~=1 && j~=N+1
            count = count +1;
            X(i,j)=x0(count);
        end
    end
end
U=U+tau*X;
error = norm(b);
end
