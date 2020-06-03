clickerdefaults;

f = @(x) 5 + 2.1169*x - 1.0130*x.^2;
[r, n, xlist] = falsi(f, [1.5,5.5], 0.1)

x = linspace(0, 6, 100);
h1 = plot(x, f(x), '-', 'Color', myblue);   % curve f(x)
hold on
plot( x, x*0, 'k', 'LineWidth', 1 );
plot( xlist(1:2), f(xlist(1:2)),    'r:' );
plot( xlist([3,2]), f(xlist([3,2])),':', 'Color', mygreen );

plot( xlist(1)*[1,1], f(xlist(1))*[0,1], 'r:', ...
      xlist(1)*[1,1], f(xlist(1))*[0,1], 'ko', ...
      'MarkerFaceColor', 'r' );
plot( xlist(2)*[1,1], f(xlist(2))*[0,1], 'r:', ...
      xlist(2)*[1,1], f(xlist(2))*[0,1], 'ko', ...
      'MarkerFaceColor', 'r' );
plot( xlist(3), 0, 'ko', 'MarkerFaceColor', 'r' );
plot( xlist(3)*[1,1], f(xlist(3))*[0,1], ':', 'Color', mygreen );
plot( xlist([3:4]), [f(xlist(3)),0], 'ko', 'MarkerFaceColor', mygreen );
plot( r, 0, 'ko', 'MarkerFaceColor', 'k' );

set( gca, 'YLim', [-15,8] );
%plot(a, pa, 'ro', 'MarkerSize', 10)
hold off
grid on
x0 = 0.15;
text( 0.4, 7, 'y=f(x)', 'Color', myblue, 'FontSize', 20 )
text( xlist(1)-x0, -1, 'x_0', 'Color', 'Red', 'FontSize', 20 )
text( xlist(2)-0.3,-1, 'x_1', 'Color', 'Red', 'FontSize', 20 )
text( xlist(3)-x0, -1, 'x_2', 'Color', 'Red', 'FontSize', 20 )
text( xlist(4)-x0, -1, 'x_3', 'Color', mygreen, 'FontSize', 20 )
text( r, 1, 'x_*', 'Color', 'k', 'FontSize', 20 )
xlabel('x'), ylabel('y')
shg
print -depsc 'falsi.eps'
savefig('falsi.fig')
