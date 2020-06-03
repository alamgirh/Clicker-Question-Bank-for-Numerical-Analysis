% Det/cond/norm for two 'large' matrix examples.
n = 7;

e = (1:n)';
A = e.^(e'-1)
det(A)
norm(A,1)
cond(A,1)

e = ones(n,1);
B = spdiags([e,-4*e,e], -1:1, n, n);
full(B)
det(B)
norm(B,1)
condest(B,1)
