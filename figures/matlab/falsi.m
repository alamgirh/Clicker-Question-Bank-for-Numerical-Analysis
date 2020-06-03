function [root, niter, xlist] = falsi( func, xint, tol )
% FALSI: Method of "false position" for solving a nonlinear equation.
%
%  Sample usage:
%     [root, niter, rlist] = false( func, xint, tol )
%
%  Input:
%     func  - function to be solved.
%     xint  - interval [xleft,xright] bracketing the root.
%             NOTE: The function MUST change sign on the interval.
%     tol   - convergence tolerance (OPTIONAL, defaults to 1e-6).
%
%  Output:
%     root  - final estimate of the root.
%     niter - number of iterations to convergence.
%     xlist - list of iterates, an array of length 'niter'.

if nargin < 3
  fprintf( 1, 'FALSI: must be called with at least three arguments' );
  error( 'Usage: [root, niter, rlist] = false( func, xint, tol' );
end
if nargin < 4, tol = 1e-6; end
if length(xint) ~= 2, error( 'Parameter ''xint'' must be a vector of length 2.' ), end  
a = xint(1); b = xint(2);

% fcnchk(...) converts function parameters to the correct type 
% to allow evaluation by feval().
func = fcnchk(func);
fa   = feval( func, a );
fb   = feval( func, b );

if( fa * fb >= 0 ) 
  error( 'FALSI: the function must change sign on the given interval' );
end

xlist = [ a; b ]; 
done  = 0;
fc    = 1.1 * tol;
niter = 0;

while( abs(fc) > tol & ~done )

  niter = niter + 1;
  
  % Compute the point where the secant line joining 
  % a and b intersects the x-axis.  
  c  = b - fb * (a-b) / (fa-fb);
  fc = feval( func, c );
  xlist = [xlist; c];
  
  % Determine which subinterval to search in the next step.
  if( fa * fc < 0 )
    b  = c; 
    fb = fc;
  elseif( fb * fc < 0 ) 
    a  = c;
    fa = fc;
  else
    done = 1;
  end
  
end

root = c;
%END falsi.
