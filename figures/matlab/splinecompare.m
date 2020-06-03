% Graphical comparison of splines with various endpoint conditions

clear all
clickerdefaults

% Data points
x = [-2, 0, 1,   1.5, 3,  4.1];
y = [ 2, 1, 1.5, 3,  2.5, 2.5];
xx = linspace(min(x), max(x), 1000); % plotting pts
        
% Not-a-knot conditions 
yknot = spline(x, y, xx);
hknot = plot(xx, yknot, 'b--');
hold on

% Clamped endpoint conditions
yclamp = spline(x, [0, y, 0], xx);
hclamp = plot(xx, yclamp, 'r-.' );

% Natural endpoint conditions
pp = csape(x, y, 'variational');
ynat = ppval(pp, xx);
hnat = plot(xx, ynat, '-', 'Color', mygreen);

% Finally, add spline points
hdata = plot(x, y, 'ko', 'MarkerFaceColor', 'r');
hold off

legend([hdata, hknot, hclamp, hnat], 'Data', 'I', 'II', 'III', ...
       'Location', 'NorthWest', 'FontName', 'Times')
% legend([hknot, hclamp, hnat], 'Not-a-knot', 'Clamped', 'Natural');
xlabel('x'), ylabel('S(x)')
grid on, shg

print -depsc 'splinecompare.eps'
savefig('splinecompare.fig')