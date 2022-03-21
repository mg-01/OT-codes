clc 
clear all
A=[1 1 1 0 5;3 2 0 1 12];
cost=[6 5 0 0 0 ];
BV=[3 4];
zjcj=cost(BV)*A-cost;
zcj=[zjcj;A];
simp_table=array2table(zcj);
simp_table.Properties.VariableNames(1:size(zcj,2))={'x1','x2','s1','s2','sol'}
RUN=true;
while(RUN)
zc=zjcj(1:end-1);
if any(zc<0)
   ('not optimal')
[enter_val,pvt_col]=min(zc);
if all(A(:,pvt_col)<0)
    error('unbounded')
else
    sol=A(:,end);
    coloumn=A(:,pvt_col);
    for i=1:size(A,1)
        if coloumn(i)>0
            ratio(i)=sol(i)/coloumn(i);
        else
            ratio(i)=inf;
        end
    end
    [leaving_val,pvt_row]=min(ratio)
end
B(pvt_row)=pvt_col
pvt_key=A(pvt_row,pvt_col)
A(pvt_row,:)=A(pvt_row,:)/pvt_key
for i=1:size(A,1)
    if(i~=pvt_row)
        A(i,:)=A(i,:)-A(i,pvt_col)*A(pvt_row,:)
    end
end
zjcj=zjcj-zjcj(pvt_col)*A(pvt_row,:)
zcj=[zjcj;A];
simp_table=array2table(zcj);
simp_table.Properties.VariableNames(1:size(zcj,2))={'x1','x2','s1','s2','sol'}
else
    RUN=false
    fprintf('optimal solution')
end
end



   
