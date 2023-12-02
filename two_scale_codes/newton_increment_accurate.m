function [U,error]=newton_increment_accurate(U,N,delta,theta,f,tau)
[V,TU] = T_epsilon_accurate_operator(U,N,delta,theta);
[central_difference1,central_difference2] = two_scale_central_difference_accurate(U,N,V,delta);

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
        direction_temp = V{i-1,j-1};
        direction=direction_temp(1,:);
        temp11=interp_coeffs_accurate(N,x+direction(1,1)*delta,y+direction(1,2)*delta);
        temp12=interp_coeffs_accurate(N,x-direction(1,1)*delta,y-direction(1,2)*delta);
        temp13=interp_coeffs_accurate(N,x+direction(1,1)*delta/2,y+direction(1,2)*delta/2);
        temp14=interp_coeffs_accurate(N,x-direction(1,1)*delta/2,y-direction(1,2)*delta/2);
        k1 = 1/(3*delta^2*(direction(1,1)^2+direction(1,2)^2));
        w1 = W1(i-1,j-1);

        A(count,count) = A(count,count) -30*w1*k1;
        temp1=[temp11;temp12];
        for k=1:12
            [itemp,jtemp] = calculate_pos(temp1(k,1),N);
            if itemp==1 || jtemp==1 || itemp==N+1 || jtemp== N+1

            else
                A(count,(itemp-2)*(N-1)+jtemp-1) = A(count,(itemp-2)*(N-1)+jtemp-1) -w1*k1*temp1(k,2);
            end
        end
        temp2=[temp13;temp14];
        for k=1:12
            [itemp,jtemp] = calculate_pos(temp2(k,1),N);
            if itemp==1 || jtemp==1 || itemp==N+1 || jtemp== N+1

            else
                A(count,(itemp-2)*(N-1)+jtemp-1) = A(count,(itemp-2)*(N-1)+jtemp-1) +16*w1*k1*temp2(k,2);
            end
        end

        direction=direction_temp(2,:);
        temp11=interp_coeffs_accurate(N,x+direction(1,1)*delta,y+direction(1,2)*delta);
        temp12=interp_coeffs_accurate(N,x-direction(1,1)*delta,y-direction(1,2)*delta);
        temp13=interp_coeffs_accurate(N,x+direction(1,1)*delta/2,y+direction(1,2)*delta/2);
        temp14=interp_coeffs_accurate(N,x-direction(1,1)*delta/2,y-direction(1,2)*delta/2);
        k1 = 1/(3*delta^2*(direction(1,1)^2+direction(1,2)^2));
        w1 = W2(i-1,j-1);

        A(count,count) = A(count,count) -30*w1*k1;
        temp1=[temp11;temp12];
        for k=1:12
            [itemp,jtemp] = calculate_pos(temp1(k,1),N);
            if itemp==1 || jtemp==1 || itemp==N+1 || jtemp== N+1

            else
                A(count,(itemp-2)*(N-1)+jtemp-1) = A(count,(itemp-2)*(N-1)+jtemp-1) -w1*k1*temp1(k,2);
            end
        end
        temp2=[temp13;temp14];
        for k=1:12
            [itemp,jtemp] = calculate_pos(temp2(k,1),N);
            if itemp==1 || jtemp==1 || itemp==N+1 || jtemp== N+1

            else
                A(count,(itemp-2)*(N-1)+jtemp-1) = A(count,(itemp-2)*(N-1)+jtemp-1) +16*w1*k1*temp2(k,2);
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