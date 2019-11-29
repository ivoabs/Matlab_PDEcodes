

%Non-uniform grids:

n=23;
x= rand(n,1);

x=[0; x ; 1];
plot (x, 'o')

%Element size:

dx = x(2:end) - x(1:end-1)

%Matrix A contruction:

%1. diagonal part:

A=diag(1./dx (1:end-1)  + 1./dx(2:end) );
%2. upper and lower parts:
A= A - diag(1./dx (2:end-1),1);
A= A - diag(1./dx (2:end-1),-1);

%Matrix b:

b=(dx (1:end-1) + dx (2:end)  )/2 ;

%linear combination coefficients:
c= A\b;


plot(x(2:end-1), c):
plot (x, [0;c;0]); 

xx=linspace(0,1,1000);
hold on;
plot (xx,0.5*xx.* (1-xx));




