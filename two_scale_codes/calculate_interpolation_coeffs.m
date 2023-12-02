function [co1,co2,co3]=calculate_interpolation_coeffs(x,y,x1,y1,x2,y2,x3,y3)
    A=[x1,y1,1;x2,y2,1;x3,y3,1];
    b1=[1,0,0]';
    b2=[0,1,0]';
    b3=[0,0,1]';
    coor_x = [x,y,1];
    co1=coor_x*(A\b1);
    co2=coor_x*(A\b2);
    co3=coor_x*(A\b3);
end
    
    
