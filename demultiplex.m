function subr = demultiplex(r, alpha, puncture);
% Copyright 1998, Yufei Wu
% MPRG lab, Virginia Tech.
% for academic use only

% At receiver end, serial to paralle demultiplex to get the code word of each
% encoder
% alpha: interleaver mapping 
% puncture = 0: use puncturing to increase rate to 1/2;
% puncture = 1; unpunctured, rate 1/3;

% Frame size, which includes info. bits and tail bits
L_total = length(r)/(2+puncture);

% Extract the parity bits for both decoders
if puncture == 1        % unpunctured
  for i = 1:L_total  
      x_sys(i) = r(3*(i-1)+1);
      for j = 1:2
          subr(j,2*i) = r(3*(i-1)+1+j);
      end
   end
else            % unpunctured
   for i = 1:L_total
       x_sys(i) = r(2*(i-1)+1);
       for j = 1:2
          subr(j,2*i) = 0;
       end   
       if rem(i,2)>0
          subr(1,2*i) = r(2*i);
       else
          subr(2,2*i) = r(2*i);
       end      
   end
end       

% Extract the systematic bits for both decoders
for j = 1:L_total
% For decoder one
   subr(1,2*(j-1)+1) = x_sys(j);
% For decoder two: interleave the systematic bits  
   subr(2,2*(j-1)+1) = x_sys(alpha(j));
end    
