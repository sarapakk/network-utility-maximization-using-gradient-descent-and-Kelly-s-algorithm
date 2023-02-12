cvx_setup
F=[0 1 0
   0 0 1
   0 1 1
   1 0 0
   1 1 1
   1 0 0
   0 1 1
   0 1 0
   0 0 1];
c=[2 2 2 2 4 2 2 2 2]';
n=3;
cvx_begin
variable y(n);
maximize(sum(log(y)))
subject to
F*y <= c
cvx_end
primal = cvx_optval