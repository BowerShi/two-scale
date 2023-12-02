function u_modyfied=lift_u(U,N,i,j,f_ij,delta,theta)
temp = evaluate_T(U,N,delta,theta,i,j,0);
if temp<f_ij
    error('value incorrect')
elseif temp==f_ij
    u_modyfied = U(i,j);
else
    U_down = 0;
    U_up = 0;
    while 1
        U_up = U_up+0.05;
        if evaluate_T(U,N,delta,theta,i,j,U_up)<f_ij
            break
        end
    end
    while 1
        U_mid = 1/2*(U_up+U_down);
        temp_mid=evaluate_T(U,N,delta,theta,i,j,U_mid);
        if temp_mid>=f_ij && temp_mid-f_ij<1e-8
              break
        end
        if temp_mid>=f_ij
            U_down = U_mid;
        else
            U_up=U_mid;
        end
    end
    u_modyfied = U(i,j) +U_mid;
end
end