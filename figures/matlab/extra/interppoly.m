%

clear all
clickerdefaults

a = 12002;
x = a+[-2:1:2];
y = (x-a).^5 - (x-a).^4 + 7*(x-a).^3 - 10*(x-a).^2 + 100;
plot(x, y, 'bo')
hold on


V = vander(x);
c = V \ y';
x2 = linspace(min(x), max(x), 100);
yv = polyval(c, x2);
plot( x2, yv, 'r-' )
hold off
