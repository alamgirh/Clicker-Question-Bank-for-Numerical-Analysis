% POWERLAW3: Generate several plots of cost  (CPU time)
% that obeys different power laws.

N = 3.^[2:15];
logN = log10(N);
n = length(N);
algA = 0.01 * N.^3 .* (1+rand(1,n));
algB =  9 * N.^(3/2) .* (1+rand(1,n));
algC = 200 * N.^(1) .* (1+rand(1,n));

plot(logN, log10(algA), 'b-o', logN, log10(algB), 'r--*', logN, log10(algC), 'g-.^');
xlabel('log_{10}N'), ylabel('log_{10}(CPU time)')
grid on, shg
legend(' Algorithm A', ' Algorithm B', 'Algorithm C', 'Location', 'NorthWest')
print -depsc 'powerlaw3a.eps'
pause

alg2 = 0.01 * N.^3 .* (1+100*rand(1,n));
plot(logN, log10(alg2), 'b-o')
xlabel('log_{10}N'), ylabel('log_{10}(CPU time)')
grid on, shg
print -depsc 'powerlaw3b.eps'
