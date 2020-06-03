clear all
clickerdefaults

a = 1.7;
f = @(x) 1-1./(1+0.5*(x-a).^2);
x = linspace(a-4, a+6, 1000);
plot( x, f(x), '-', 'Color', myblue );
plist = [a-0.8, a+0.5, a+2, a+4];
hold on
plot( plist, 0*plist, '+', 'Color', myblue );
plot( plist, f(plist), 'ko', 'MarkerFaceColor', 'r')
plot( x, 0*x, 'k-', 'LineWidth', 1 )
plot( 0*x, x, 'k-', 'LineWidth', 1 )
text( plist(1)-0.1, -0.1, 'x_1', 'Color', myblue )
text( plist(2)-0.1, -0.1, 'x_2', 'Color', myblue )
text( plist(3)-0.1, -0.1, 'x_3', 'Color', myblue )
text( plist(4)-0.1, -0.1, 'x_4', 'Color', myblue )
hold off
set(gca, 'XLim', [min(x), max(x)], 'YLim', [-0.3, 1.2])
grid on, shg
print -depsc 'newton.eps'
savefig('newton.fig')
