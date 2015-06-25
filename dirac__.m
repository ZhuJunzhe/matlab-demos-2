function f=dirac_(delta, t)
f=zeros(1,length(t));
n=1;
while(t(n)<=delta)
    f(1,n)=1/delta;
    n=n+1;
end;

