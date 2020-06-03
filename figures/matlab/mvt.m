%
% MVT: Plot of mean value theorem example from class.
%
% John Stockie, SFU (MACM 316)
%
clickerdefaults;

a = 0.5;
b = 2.5;
c = 1.6073;

pa = 0.875;
pb = 45.375;
pc = 11.8491;

x  = [0.0 : 0.01 : 3];
p  = 1 - x + 3 .* x .^ 3;
m1 = -10.25   + 22.5 .* x;
m2 = -23.9128 + 22.5 .* x;
 
close all
hold on

h1=plot(x, p, '-', 'color', myblue);   % curve f(x)
h2=plot(x, m1, 'r--');  % secant
h3=plot(x, m2, '--', 'Color', mygreen);  % tangent

plot( [a a], [-40 pa], 'k:')
plot( [b b], [-40 pb], 'k:')
plot( [c c], [-40 pc], 'k:')

plot(a, pa, 'ro', 'MarkerSize', 10)
plot(b, pb, 'ro', 'MarkerSize', 10)
plot(c, pc, 'o', 'Color', mygreen, 'MarkerSize', 10)
hold off
legend([h1], ' f(x)', 'Location', 'NorthWest' );
%legend([h1,h2,h3], ' f(x)', ' secant', ' tangent', 'Location', 'NorthWest' );
grid on
text( 0.54, -36, 'a', 'Color', 'Red', 'FontSize', 24 )
text( 2.54, -36, 'b', 'Color', 'Red', 'FontSize', 24 )
text( 1.64, -36, 'c', 'Color', mygreen, 'FontSize', 24 )
xlabel('x'), ylabel('y')

print -depsc 'mvt2.eps'
savefig('mvt2.fig')
