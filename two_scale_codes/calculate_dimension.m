function dim=calculate_dimension(polyvector,k,pos)
syms x y z;
A=zeros(length(polyvector),(k+3)*(k+2)*(k+1)/6);
for i=1:length(polyvector)
    vec = polyvector(i);
    [cxyz, txyz] = coeffs(vec, [x,y,z]);
    for j=1:length(cxyz)
        deg1=polynomialDegree(txyz(j),x);
        deg2=polynomialDegree(txyz(j),y);
        deg3=polynomialDegree(txyz(j),z);
        A(i,pos(deg1+1,deg2+1,deg3+1)) = cxyz(j);
    end
end
dim=rank(A);

