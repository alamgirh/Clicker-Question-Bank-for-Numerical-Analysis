% Interpolation/fitting example: compare polynomial and spline
% interpolation and curve fitting.

clear all
clickerdefaults

% Gasoline price data ($/gal)
x = [1986 : 2 : 1996];
xshift = min(x);
x = x - xshift;
y = [0.927, 0.946, 1.164, 1.127, 1.112, 1.147];
n = length(x);

xx = linspace(x(1), x(end), 1000); % plotting points

% Polynomial interpolant (degree n-1)
pp = polyfit( x, y, n-1 );
ypoly = polyval( pp, xx );
hold on
h2 = plot( xx+xshift, ypoly, 'r-' );

% Piecewise linear spline (degree n-1)
h3 = plot( x+xshift, y, 'c-.' );

% Piecewise cubic spline interpolant (n-1 intervals)
pp = spline( x, y );
yspline = ppval( pp, xx );
h4 = plot( xx+xshift, yspline, '--', 'Color', mygreen );

% Least squares fit (degree 3)
deg = 4;
Alsq = x .^ ([0:deg]');
clsq = (Alsq*Alsq') \ (Alsq*y');
ylsq = polyval( flip(clsq)', xx );
h5 = plot( xx+xshift, ylsq, 'k:' );

% Plot the data points
h1 = plot( x+xshift, y, 'ko', 'MarkerFaceColor', 'r' );
xlabel('x'), ylabel('y')
grid on, shg

hold off
%legend('Data', 'Interpolant', 'Linear spline', 'Cubic spline', ...
%       'LSQ fit', 'Location', 'SouthEast')
legend([h1, h2, h3, h4, h5], 'Data', 'I', 'II', 'III', 'IV', ...
       'FontName', 'Times', 'Location', 'SouthEast')

print -depsc 'interpex1.eps'
savefig('interpex1.fig')
