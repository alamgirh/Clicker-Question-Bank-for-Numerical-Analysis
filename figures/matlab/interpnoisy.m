% Generate data on the interval [a,b] that vary in a roughly cubic
% manner.  To obtain noisy-looking data, the x-coordinates are
% randomly selected from [a,b] and then the y-coordinates are
% given an additive random perturbation.
% 
% The data are then approximated by the following functions:
% - a polynomial interpolant,
% - a piecewise cubic spline interpolant, and
% - a least-squares cubic polynomial fit.

clear all
clickerdefaults

n = 8;            % number of pts
a = -0.5; b = 2;  % interval

% Smooth cubic function
f = @(x) 2+(x+0.5).*(x-0.77).*(x-1.4);

x  = [a-0.1 : 0.01 : b+0.1];    % dense plotting pts
y  = f(x);                      % exact y-values
x2 = [a : 0.25 : b];            % equally spaced pts
rngstate1 = rng;
x2 = sort(a + (b-a)*rand(1,n)); % randomly spaced pts
rngstate2 = rng;
y2 = f(x2) + 0.5*(1-2*rand(size(x2))); % noisy data
plot( x2, y2, 'ko', 'MarkerFaceColor', 'r' );
xlabel('x'), ylabel('y')
grid on, shg
print -depsc 'interpnoisy1.eps'
savefig('interpnoisy1.fig')
save 'interpnoisy.mat' rngstate1, rngstate2

% Polynomial interpolant (degree n-1)
pp = polyfit( x2, y2, length(x2)-1 );
ypoly = polyval( pp, x );
hold on
plot( x, ypoly, 'r-' )

% Piecewise spline interpolant (n-1 intervals)
pp = spline( x2, y2 );
yspline = ppval( pp, x );
plot( x, yspline, '--', 'Color', mygreen )

% Least squares fit (degree 3)
deg = 3;
Alsq = x2 .^ ([0:deg]');
clsq = (Alsq*Alsq') \ (Alsq*y2');
ylsq = polyval( flip(clsq)', x );
plot( x, ylsq, 'k:' )
hold off
set(gca, 'XLim', [a-0.1, b+0.1], 'YLim', [min(y2)-1, max(y2)+1]) 
legend( 'Data', 'Interpolant', 'Spline', 'LSQ fit', 'Location', 'North' )
print -depsc 'interpnoisy2.eps'
savefig('interpnoisy2.fig')
