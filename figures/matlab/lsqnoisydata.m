% Compute several least-squares polynomial fits to a 
% set of noisy data points, along with the corresponding
% RMS errors.  Run the code until random perturbations 
% in the data generate some "wiggles" in the 
% highest-order approximation.  This is intended to
% illustrate that a small RMS error isn't always a 
% reliable measure of quality-of-fit.

clear all
clickerdefaults

f = @(x) (x-2).^3 - 4*(x-2) + 1;
a = 0; b = 5;    % interval
n = 100;         % number of data points

% First, generate the "randomized" data, by 
% randomly selecting x values in [a,b] and then 
% randomly-perturbing the smooth polynomial f(x).
x  = a + (b-a)*rand(1,n);
fx = f(x) + 3*(-1+2*rand(1,n));
hdata = plot( x, fx, 'ko', 'Markersize', 8, 'MarkerFaceColor', 'r' );
xlabel('t'), ylabel('Data')
grid on, shg
xx = linspace(a, b, 1000);  % plotting points
hold on

% Quadratic fit
deg = 2;
A = x.^([0:deg]');
c = (A*A') \ (A*fx');
yy2 = polyval( flip(c)', xx );
y2  = polyval( flip(c)', x );
rms2 = sqrt(sum((y2-fx).^2) / n) 
h2 = plot( xx, yy2, '-', 'Color', myblue );

% Cubic fit
deg = 3;
A = x.^([0:deg]');
c = (A*A') \ (A*fx');
yy3 = polyval( flip(c)', xx );
y3  = polyval( flip(c)', x );
rms3 = sqrt(sum((y3-fx).^2) / n) 
h3 = plot( xx, yy3, '--', 'Color', mygreen );

% Higher-order polynomial fit
deg = 7;
A = x.^([0:deg]');
c = (A*A') \ (A*fx');
yy7 = polyval( flip(c)', xx );
y7  = polyval( flip(c)', x );
rms7 = sqrt(sum((y7-fx).^2) / n) 
h7 = plot( xx, yy7, 'm:' );
hold off
legend( [hdata, h2, h3, h7], 'Data', 'Fit I', 'Fit II', 'Fit III', ...
        'Location', 'NorthWest', 'FontName', 'Times' );

print -depsc 'lsqnoisydata.eps'
savefig('lsqnoisydata.fig')
