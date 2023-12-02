function [U,error]=newton_increment(U,N,delta,theta,f,tau)
[V,TU] = T_epsilon_operator(U,N,delta,theta);
[central_difference1,central_difference2] = two_scale_central_difference(U,N,V,delta);

W1 = H_plus(central_difference1).*matplus(central_difference2)-H_minus(central_difference1);
W2 = H_plus(central_difference2).*matplus(central_difference1)-H_minus(central_difference2);

A = sparse((N-1)^2,(N-1)^2);
b = zeros((N-1)^2,1);
h=1/N;
count=0;
for i=2:N
    for j=2:N
        count = count +1;
        x=(j-1)*h;
        y=(i-1)*h;
        b(count) = f((j-1)*h,(i-1)*h)-TU(i-1,j-1);
        direction = V{i-1,j-1};
        temp11=interp_coeffs(N,x+direction(1,1)*delta,y+direction(1,2)*delta);
        temp12=interp_coeffs(N,x-direction(1,1)*delta,y-direction(1,2)*delta);
        k1 = 1/(delta^2*(direction(1,1)^2+direction(1,2)^2));
        w1 = W1(i-1,j-1);
        A(count,count) = A(count,count) -2*w1*k1;

        temp=[temp11;temp12];
        for k=1:6
            [itemp,jtemp] = calculate_pos(temp(k,1),N);
            if itemp==1 || jtemp==1 || itemp==N+1 || jtemp== N+1
                
            else
                A(count,(itemp-2)*(N-1)+jtemp-1) = A(count,(itemp-2)*(N-1)+jtemp-1) + w1*k1*temp(k,2);
            end
        end

        temp21=interp_coeffs(N,x+direction(2,1)*delta,y+direction(2,2)*delta);
        temp22=interp_coeffs(N,x-direction(2,1)*delta,y-direction(2,2)*delta);
        temp=[temp21;temp22];
        k2 = 1/(delta^2*(direction(2,1)^2+direction(2,2)^2));
        w2 = W2(i-1,j-1);

        A(count,count) = A(count,count) -2*w2*k2;
        for k=1:6
            [itemp,jtemp] = calculate_pos(temp(k,1),N);
            if itemp==1 || jtemp==1 || itemp==N+1 || jtemp== N+1
                
            else
                A(count,(itemp-2)*(N-1)+jtemp-1) = A(count,(itemp-2)*(N-1)+jtemp-1) + w2*k2*temp(k,2);
            end
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