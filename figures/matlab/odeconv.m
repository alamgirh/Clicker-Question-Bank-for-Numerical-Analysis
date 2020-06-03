% ODECONV: Estimate the order of accuracy for various ODE solvers, 
% using a sequence of computations with successively smaller time 
% step.

clear all
clickerdefaults

imeth = 1; % 1=Euler, 2=modEuler/Heun, 3=RK4

% Define the ODE problem:
f = @(t,y) -y + t.*sqrt(y);  % RHS function
ab = [0, 2];    % time interval [a,b]
y0 = 1;         % initial condition y(a)
n0 = 4;     
nruns = 8;      % at least 3

nlist = n0 * 2.^[0:nruns-1]';
hlist = diff(ab) ./ nlist; 
yfinal = 0*hlist;
for i = 1 : nruns,
  nt = nlist(i) + 1;
  h  = hlist(i);
  t  = linspace(ab(1), ab(2), nt);
  y  = 0*t;
  y(1) = y0;
  for j = 1 : nlist(i),
    switch imeth,
     case 1, 
      y(j+1) = y(j) + h*f(t(j), y(j));
     case 2, 
      k1 = f(t(j), y(j));
      k2 = f(t(j+1), y(j) + h*k1);
      y(j+1) = y(j) + h * (k1 + k2) / 2;
     otherwise, 
      k1 = f(t(j), y(:,j));
      k2 = f(t(j) + h/2, y(j) + h/2*k1);
      k3 = f(t(j) + h/2, y(j) + h/2*k2);
      k4 = f(t(j+1), y(j) + h*k3);
      y(j+1) = y(j) + h * (k1 + 2*k2 + 2*k3 + k4) / 6;
    end 
    yfinal(i) = y(end);
  end
end
  
% Use the ratio of successive differences to estimate 
% order of accuracy.  Alternately, if an exact solution
% is available, then 'ydiff' could be replaced by the
% actual error.
ydiff = abs(diff(yfinal))'
pest  = log2(ydiff(1:end-1) ./ ydiff(2:end))

figure(1)
methstr = {'Euler'; 'Mod. Euler'; 'RK4'};
loglog( hlist(1:end-1), ydiff, 'b-o' )
xlabel('h'), ylabel('Error')
set( gca, 'XMinorGrid', 'off', 'YMinorGrid', 'off' )
%legend( methstr, 'Location', 'SouthEast' )
grid on, shg
print -depsc 'odeconv.eps'
savefig('odeconv.fig')
