function S_theta_perp = modify_Vectors(S_theta_perp,D,delta,x,y)
for i=1:D
    vector = S_theta_perp{i};
    S_theta_perp{i} = [modify_Vector(vector(1,:),delta,x,y);modify_Vector(vector(2,:),delta,x,y)];
end
end