% CONVPLOT: Generate a sample plot of convergence for two artificial
% 'methods' having different order of convergence and initial error.  
% The results should be viewed in the context of the definition of
% convergence:
%  
%    E_k <= alpha * E_{k-1}^p
%         
%        <= ... <= alpha^k * E_0^(p^k)
%
% where E_k is abs/rel error in step k
%       alpha is asymptotic rate of convergence
%       p is order of convergence

clickerdefaults;

alpha = 0.31;   % asymptotic rate constant
p1 = 1;         % order of convergence
p2 = 1.5;  
E01 = 0.1;      % initial error
E02 = 0.53;
reps = 0.7;     % size of random perturbation
k = [0:10];     % iteration number
Ek1 = alpha.^k .* E01.^(p1.^k) .* (1-reps+2*reps*rand(1,length(k)));
Ek2 = alpha.^k .* E02.^(p2.^k) .* (1-reps+2*reps*rand(1,length(k)));

% Linear convergence is 'obvious' on a semilog plot
plot( k, Ek1, 'b-o', k, Ek2, 'r-.^' )
set(gca, 'YLim', [eps, max(Ek2)])
xlabel('Iteration, k')
ylabel('Error, E_k')
legend('Method 1', 'Method 2') 
grid on, shg, pause(1)
print -depsc 'convplot.eps'
savefig('convplot.fig')

set(gca, 'YScale', 'log')
print -depsc 'convplotlog.eps'
savefig('convplotlog.fig')
