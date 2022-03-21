clc
clear all
%2x+y=100, x+y=80
A=[2 1;1 1];
B=[100;80];
x1=0:1:max(B);
y1=(B(1)-A(1,1)*x1)/A(1,2);
y2=(B(2)-A(2,1)*x1)/A(2,2);
y1=max(0,y1);
y2=max(0,y2);
plot(x1,y1,x1,y2)
legend('2x-y=100','x+y=80')
xlabel('value of x')
ylabel('value of y')
%to find intersection
A=[2 1;1 1;1 0;0 1];
B=[100;80;0;0];
pt=[0;0];
m=size(A,1);
for i=1:m-1
    for j=i+1:m
       a1=A(i,:);
       a2=A(j,:);
       a3=[a1;a2];
       b1=B(i);
       b2=B(j);
       b3=[b1;b2];
       X=inv(a3)*b3;
       X=max(0,X);
       pt=[pt,X];
    end
end
x=pt';
x=unique(x,'rows')
x1=x(:,1);
x2=x(:,2);
const1=round(2*x1+x2-100);
s1=find(const1>0);
x(s1,:)=[];
x1=x(:,1);
x2=x(:,2);
const1=round(x1+x2-80);
s2=find(const1>0);
x(s2,:)=[];
x1=x(:,1);
x2=x(:,2);
const1=round(x1);
s3=find(const1<0);
x(s3,:)=[];
x1=x(:,1);
x2=x(:,2);
const1=round(x2);
s1=find(const1<0);
x(s1,:)=[];
x
%max C=2x+5y
C=[2;5];
output=x;
for i=1:size(x,1)
    fn(i,:)=(x(i,:)*C)
end
optimal_val=max(fn)