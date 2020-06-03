% Euler example

clear all
clickerdefaults
        
% Define the ODE problem (RHS function is at end)
yex = @(x) x.*exp(-x.^2);
ab = [0, 2];    % time interval [a,b]
y0 = 0;         % initial condition y(a)
nx = 20;     

h  = diff(ab) / nx;
x  = linspace(ab(1), ab(2), nx+1);
y  = 0*x;
y(1) = y0;
for j = 1 : nx, 
  y(j+1) = y(j) + h * f(x(j), y(j));
end

xx = linspace(ab(1), ab(2), 1000);
plot(xx, yex(xx), 'b-')
hold on
plot(x, y, 'r*')
hold off
xlabel('x'), ylabel('y(x)')
legend( 'exact', 'computed' )
grid on, shg
print -depsc 'ode3.eps'
savefig('ode3.fig')

function ret = f(x,y) 
if x == 0, 
  ret = 1;
else
  ret = y .* (-2*x + 1./x);
end
end
