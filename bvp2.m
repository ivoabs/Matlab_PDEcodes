function [x,U] = bvp2 (f, a ,b, ua, ub, N,p,r)
% solve -p*u'' +r*u =f; u(a)=ua; u(b)=ub
% with finite diff.
h= (b-a)/(N+1);
z=a:h:b;
%z=linspace(a,b,N+2)
x=z(2:end-1)';
e = ones(N,1);
A = spdiags([-p*e (2*p+r*(h^2))*(p*e) -p*e], -1:1, N, N);
F = h^2*f(x); F(1)= F(1)+ ua; F(N)= F(N)+ ub;
U = A\F;
x=z;
U =[ua; U;ub];