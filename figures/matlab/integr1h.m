% Quadrature formulas approximating the integral.
% Show convergence in h for three formulas of order 1/2/4.

clear all
clickerdefaults

f    = @(x)  3*sin(x) - x.^2/20 + 1;
fint = @(x) -3*cos(x) - x.^3/60 + x;
a = 0;
b = 3*pi;

format long
Aex = fint(b) - fint(a)  % exact integral
format short

for i = [1:11],
  n = 2.^i;
  nlist(i) = n;
  h = (b - a) / n;
  hlist(i) = h;
  x = linspace(a, b, n+1);  % n panels ==> n+1 points
  fx = f(x); 
  
  Arect(i) = h * sum(fx(1:end-1));
  Atrap(i) = h/2 * (fx(1) + fx(end) + 2*sum(fx(2:end-1)));
  Asimp(i) = h/3 * (fx(1) + fx(end) + 4*sum(fx(2:2:end-1)) ...
                 + 2*sum(fx(3:2:end-2)));
  fprintf( '%7d |  %12.9f   %12.9f   %12.9f\n', n, Arect(i), Atrap(i), Asimp(i) );
end

loglog( hlist, abs(Arect-Aex), '-o', 'Color', myblue, 'MarkerFaceColor', 'w' ) 
hold on
loglog( hlist, abs(Atrap-Aex), 'r-^', 'MarkerFaceColor', 'w' ) 
loglog( hlist, abs(Asimp-Aex), '-s', 'Color', mygreen, 'MarkerFaceColor', 'w' ) 
hold off
grid on, shg
legend( 'Formula A', 'Formula B', 'Formula C', 'Location', 'SouthEast' )
%legend( 'Rectangle', 'Trapezoid', 'Simpson''s', 'Location', 'SouthEast' )
set( gca, 'XLim', [3e-3, 1e1], 'YLim', [1e-11, 5e1], 'XMinorGrid', 'off', 'YMinorGrid', 'off' )
xlabel('h'), ylabel('Error')
print -depsc 'integr1h.eps'
savefig('integr1h.fig')
