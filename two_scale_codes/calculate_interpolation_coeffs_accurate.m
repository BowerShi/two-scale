function coeffs=calculate_interpolation_coeffs_accurate(x,y,data)
% ax^2+bxy+cy^2+dx+ey+f
    coeffs=zeros(6,1);
    A=[data(:,1).^2,data(:,1).*data(:,2),data(:,2).^2,data(:,1),data(:,2),ones(6,1)];
    for i=1:6
        b=zeros(6,1);
        b(i)=1;
        coeff_i = A\b;
        coeffs(i)=[x^2,x*y,y^2,x,y,1]*coeff_i;
    end
end
    
    
