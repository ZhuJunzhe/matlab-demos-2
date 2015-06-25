function f=dirac_(delta, t)
f=zeros(1,length(t));
n=1;
while((t(n)<=delta))
    if(t(n)>=0)
    f(1,n)=1;
    end;
    n=n+1;
end;

