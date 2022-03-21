clc
clear all
A=[-1 1 1 0;1 1 0 1];
b=[1;2];
C=[1 2 0 0];
[m,n]=size(A)
nv=nchoosek(n,m)
t=nchoosek(1:n,m)
sol=[]
if n>m
for i=1:nv
y=zeros(n,1)
x=A(:,t(i,:))\b;
if all(x>=0 & x~=inf & x~=-inf)
y(t(i,:))=x;
sol = [sol y]
end
end
else
error('n<m : no solution exit')
end
z= C*sol
[val, ind]= max(z);
ans=sol(:,ind);
opt=[ans' val]
opt_table=array2table(opt);
opt_table.Properties.VariableNames(1:size(opt,2))={'x1','x2','x3','x4','sol'}