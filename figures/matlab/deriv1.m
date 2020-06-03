% Finite difference approximation of the derivative. 
% Show convergence in h for three formulas of order 1/2/4.
clear all
clickerdefaults

f = @(x) 3*sin(x)-x.^2/20 + 1;
fp= @(x) 3*cos(x)-x/10;

x0  = 1;
dex = fp(x0);
for h = 0.5.^[1:8], 
  d1 = (f(x0) - f(x0-h)) / h;
  d2 = (f(x0+h) - f(x0-h)) / (2*h);
  d3 = (-25/12*f(x0) + 4*f(x0+h) - 3*f(x0+2*h) + 4/3*f(x0+3*h) ... 
        - 1/4*f(x0+4*h)) / h;
  fprintf( '%8.6f | %7.3e %7.3e %7.3e\n', h, abs(d1-dex), ...
           abs(d2-dex), abs(d3-dex) );
end

  
  