function int_state = int_state( state )

% converts a row vector of m bits into a integer (base 10)

% Based on the simulation written by Yufei WuNov 1998 MPRG lab, Virginia
% Tech.

[dummy, m] = size( state );

for i = 1:m
   vect(i) = 2^(m-i);
end

int_state = state*vect';
