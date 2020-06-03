% Picture for the robot path planning example.

clear all
clickerdefaults

x = [1,   2, 4,   6, 7.5, 9,   11];
y = [5.5, 7, 6.8, 6, 5.2, 3.9, 5.5];
plot(x, y, 'ko', 'MarkerFaceColor', 'r')
hold on
fill([2.4,5.4,4.5,1.5]+0.5, [6,5,3,4]+0.6, myblue)
xy0 = [9.4,6]; a0 = 0.9; b0 = 1.5;
th  = linspace(0,2*pi,500);
xell= xy0(1) + a0*cos(th);% + b0*sin(th); 
yell= xy0(2) + b0*sin(th);% + b0*cos(th); 
fill(xell, yell, mygreen)
set(gca, 'XLim', [0, 12], 'YLim', [0, 8])
hold off
xlabel('x'), ylabel('y')
grid on, shg

print -depsc 'robotpath.eps'
savefig('robotpath.fig')
