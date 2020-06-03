% POWERLAW2: Generate several different log/linear-scale
% plots of converging iterations.

k = [1 : 20];
n = length(k);
E0 = 0.9;

alpha = 1/2; 
meth1 = alpha.^k * E0 .* (1+rand(1,n));  % linear (bisection)
alpha = 1/8;
meth2 = alpha.^k * E0 .* (1+rand(1,n));  % linear

alpha = 0.9;
p = 1.5;                % superlinear
meth3 = alpha.^((p.^k-1)/(p-1)) .* E0.^(p.^k) .* (1+rand(1,n));
p = 2;                  % quadratic (Newton)
meth4 = alpha.^((p.^k-1)/(p-1)) .* E0.^(p.^k) .* (1+rand(1,n));

plot(k, meth1, 'b-o', k, meth2, 'r--*', k, meth3, 'g-.^', k, meth4, 'k:+' )
xlabel('k'), ylabel('error')
title('(A) Linear scale')
grid on, shg
legend(' Method 1', ' Method 2', 'Method 3', 'Method 4', 'Location', 'NorthEast')
print -depsc 'powerlaw2a.eps'
pause

semilogy(k, meth1, 'b-o', k, meth2, 'r--*', k, meth3, 'g-.^', k, meth4, 'k:+' )
xlabel('k'), ylabel('error')
title('(B) Semi-log scale')
grid on, shg
set(gca, 'YLim', [1e-18, 1e0]);
legend(' Method 1', ' Method 2', 'Method 3', 'Method 4', 'Location', 'SouthWest')
print -depsc 'powerlaw2b.eps'
pause

loglog(k, meth1, 'b-o', k, meth2, 'r--*', k, meth3, 'g-.^', k, meth4, 'k:+' )
xlabel('k'), ylabel('error')
title('(C) Log-log scale')
grid on, shg
set(gca, 'YLim', [1e-18, 1e0]);
legend(' Method 1', ' Method 2', 'Method 3', 'Method 4', 'Location', 'SouthWest')
print -depsc 'powerlaw2c.eps'
