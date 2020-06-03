clear all
clickerdefaults

x = [0, 1, 1];
xx = [-0.2, 1.2];
y = [0, 0, 1];
A = [x.^0; x];
c = (A*A') \ (A*y');
ylsq = polyval( flip(c)', xx );

plot( xx, ylsq, 'b-', x, y, 'ko', ...
      'MarkerSize', 10, 'MarkerFaceColor', 'r' )
set(gca, 'XLim', [-0.2, 1.2], 'YLim', [-0.2, 1.2])
xlabel('x'), ylabel('y')
grid on, shg
print -depsc 'lsqex1.eps'
savefig('lsqex1.fig')
