function u=calculate_interpolation_value_accurate(x,y,data)
% ax^2+bxy+cy^2+dx+ey+f
    A=[data(:,1).^2,data(:,1).*data(:,2),data(:,2).^2,data(:,1),data(:,2),ones(6,1)];
    coeffs = A\data(:,3);
    u=[x^2,x*y,y^2,x,y,1]*coeffs;
end
    
    
