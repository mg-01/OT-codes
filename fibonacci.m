clc
clear all
fibo(1)=1;
fibo(2)=1;
n=7;
for i=3:n+1
    fibo(i)=fibo(i-1)+fibo(i-2);
end
fibo
f=@(x)x^2;
L=-5;
R=15;
for i=1:n
    ratio=fibo(n-i+1)/fibo(n-i+2);
    X2=L+ratio*(R-L);
    X1=L+R-X2;
    table(i,:)=[i L R X1 X2 f(X1) f(X2)];
    if f(X1)<f(X2)
        R=X2;
    elseif f(X2)<f(X1)
        L=X1;
    else
        if min(abs(L),abs(f(X1)))==abs(L)
            R=X2;
        else
            L=X1;
        end
    end
end
table
Xmid=(L+R)/2
Value=f(Xmid)
