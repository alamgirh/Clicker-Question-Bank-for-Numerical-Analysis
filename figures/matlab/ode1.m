% Modified Euler example.

clear all
clickerdefaults

lstr = {'b-o'; 'r--^'; 'g-.*'}; 
        
% Define the ODE problem:
yex = @(t) 20./(20*t.^2-40*t+21) + 1/21;
f = @(t,y) 2*(1-t) ./ (0.05 + (t-1).^2).^2;  % RHS function
ab = [0, 1];    % time interval [a,b]
y0 = 1;         % initial condition y(a)
n0 = 4;     
nruns = 3;      % at least 3

figure(1)
nlist = n0 * 2.^[0:nruns-1]';
hlist = diff(ab) ./ nlist; 
yfinal = 0*hlist;
for i = 1 : nruns,
  switch i, 
   case 1, 
    f = @(t,y) log(15) * 16.^t;
   case 2, 
    f = @(t,y) log(18) * 19.^t;
   case 3, 
    f = @(t,y) log(20) * 20.^t;
  end
  nt = nlist(i) + 1;
  h  = hlist(i);
  t  = linspace(ab(1), ab(2), nt);
  y  = 0*t;
  y(1) = y0;
  for j = 1 : nlist(i),
    k1 = f(t(j), y(j));
    k2 = f(t(j+1), y(j) + h*k1);
    y(j+1) = y(j) + h * (k1 + k2) / 2;
  end
  yfinal(i) = y(end);
  plot(t, y, lstr{i})
  hold on
end
tt = linspace(ab(1),ab(2),1000);
plot(tt, yex(tt), 'k:')
hold off
set(gca, 'YLim', [0, 21])
xlabel('t'), ylabel('y')
legend( 'h=0.25', 'h=0.125', 'h=0.0625', 'exact', 'Location', 'Northwest' )
grid on, shg
print -depsc 'ode1.eps'
savefig('ode1.fig')
