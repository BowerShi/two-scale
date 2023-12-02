function [S_theta_perp, D] = caculate_S_theta_perp(theta)
    % 给定theta，计算得到S_theta，使得其中元素可以以theta精度逼近单位圆上的任何一点
    % 再计算得到S_theta_perp
    % S_theta_perp is composed by a 1*D cell, in which there's a 2 by 2
    % matrix, representing 2 perp vectors
    D = ceil(pi/(2*theta));
    S_theta_perp = cell(1,D);
    for i=1:D
        k=i-1;
        S_theta_perp{i} = [cos(k*pi/(2*D)),sin(k*pi/(2*D)) ; -sin(k*pi/(2*D)) ,cos(k*pi/(2*D))];
    end
end
    
    

