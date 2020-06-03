% POWERLAW1: Investigate the error in the Taylor polynomial 
% for f(x) = x ln(x) using various log-scale plots.

f = @(x) x .* log(x);
T2 = @(x) (x-1) + (x-1).^2/2;
T3 = @(x) (x-1) + (x-1).^2/2 - (x-1).^3/6;

h = 10.^[-8:0.1:0];
x = 1+h;
fx = f(x);
t2x = T2(x);
t3x = T3(x);
t2x = h + h.^2/2;
t3x = t2x - h.^3/6;
err2 = abs(fx-t2x);
err3 = abs(fx-t3x);

semilogy(h, err2, 'b-', h, err3, 'r--')
xlabel('h'), ylabel('error')
grid on, shg
legend(' P_A(x_0+h)', ' P_B(x_0+h)', 'Location', 'SouthEast')
print -depsc 'powerlaw1a.eps'
pause

loglog(h, err2, 'b-', h, err3, 'r--')
set(gca, 'XMinorGrid', 'off')
set(gca, 'YMinorGrid', 'off')
xlabel('h'), ylabel('error')
grid on, shg
legend(' P_A(x_0+h)', ' P_B(x_0+h)', 'Location', 'SouthEast')
print -depsc 'powerlaw1b.eps'
pause

h0 = 0.2;
tnlist = zeros(25,1);
tnlist(1) = h0;
for n = 2 : length(tnlist), 
  tnlist(n) = tnlist(n-1) + (-h0)^n/n/(n-1);
end
errlist = abs(tnlist - f(1+h0));
semilogy(1:n, errlist, 'b-o')
set(gca, 'YLim', [1e-17, 1e0])
xlabel('# terms (N)')
ylabel('error')
grid on, shg
print -depsc 'powerlaw1c.eps'



