alist = [1, 0, -5, 0.1];
%alist = [1];
x = linspace(-10, 10, 100);
y1 = sin(x);
plot(x, y1, 'b-');
xlabel('x'), ylabel('y')
hold on

if length(alist) == 1, 
  aleg = 'y = x';
else 
  aleg = 'y = a*x'; 
end

for a = alist, 
  y2 = a*x;
  plot(x, y2, 'r:')  
end
hold off
legend('y = sin(x)', aleg)
grid on, shg
axis equal
set(gca, 'XLim', [min(x), max(x)])
set(gca, 'YLim', [-4, 4])

print -depsc 'xsinx.eps'
