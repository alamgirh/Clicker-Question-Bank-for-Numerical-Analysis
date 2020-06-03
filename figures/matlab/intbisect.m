% Display function values corresponding to endpoints
% of several possible intervals for the bisection
% method, along with the desired positive root.

clear all
clickerdefaults

f = @(x) 2*x.*cos(pi*x)-exp(x-1);
x = linspace(-1.2, 2.2, 1000);
y = f(x);

plot(x, y, 'Color', myblue )
hold on
plot(x, 0*x, 'k-', 'LineWidth', 0.5)
ylim = [-3.5,2.5];
plot(0*ylim, ylim, 'k-', 'LineWidth', 0.5)
xpts = -1:2;
ypts = f(xpts);
%plot(xpts, ypts, 'ko', 'MarkerFaceColor', 'r' )
plot(xpts, ypts, 'o', 'Color', myblue)
xroot = fsolve(f, 1.5)
plot(xroot, 0, 'ko', 'MarkerFaceColor', 'r' )
text(xroot-0.77, 0.2, 'Positive root', 'FontSize', 16)
xroot = fsolve(f, -0.5)
plot(xroot, 0, 'o', 'Color', 0.5*mygrey, 'MarkerFaceColor', mygrey )
hold off
xlabel('x'), ylabel('g(x)')
set(gca, 'XLim', [x(1),x(end)], 'YLim', ylim)
grid on, shg

print -depsc 'intbisect.eps'
savefig('intbisect.fig')
