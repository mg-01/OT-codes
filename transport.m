clc
clear all;
cost=[11 20 7 8;21 16 10 12;8 12 18 9;]
A=[50 40 70];
B=[30 25 35 40];
if sum(A)==sum(B)
    fprintf('balanced')
else 
    fprintf('unbalanced')
    if sum(B)<sum(A)
        B(end+1)=sum(A)-sum(B)
        cost(:,end+1)=zeros(size(A))
    else
        A(end+1)=sum(B)-sum(A)
        cost(end+1,:)=zeros(size(B))
    end
end
icost=cost
Y1=zeros(size(cost))
for i=1:size(cost,1)
    for j=1:size(cost,2)
[val,ind]=min(min(cost))
[row,col]=find(val==cost)

y = min(A(row),B(col))
[value,index]=max(y)
Prow = row(index)
Pcol = col(index)
Y1(Prow,Pcol)=value
if A(Prow)>B(Pcol)
    A(Prow)=A(Prow)-B(Pcol)
    B(Pcol)=0
else
    B(Pcol)=B(Pcol)-A(Prow)
    A(Prow)=0
end
cost(Prow,Pcol) = inf
    end
    
end
xyz = icost.*Y1
leastcost=sum(xyz(:))