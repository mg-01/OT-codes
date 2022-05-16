clear all
clc
format short
c=[2 4 5 ;4 3 3 ;5 1 7 ;1 4 6 ];
s=[4 8 5 12]
d=[6 8 15]
[m,n]=size(c)
if sum(s)==sum(d)
    disp('balance')
elseif sum(s)<sum(d)
    c=[c;zeros(1,n)]
    s=[s sum(d)-sum(s)]
else
    c=[c zeros(m,1)]
    d=[d sum(s)-sum(d)]
end
while(sum(d)>0)
 min_cost=min(min(c))
    [row,col]=find(c==min_cost)
    min_alo=min(s(row),d(col))
    [maximum, index]=max(min_alo)
    s(row(index))= s(row(index))-maximum 
     d(col(index))= d(col(index))-maximum 
    c(row(index), col(index))=100
end