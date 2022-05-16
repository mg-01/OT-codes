clc
clear all
A=[-1 -1 1 1 0 -5; -1 2 -4 0 1 -8];
BV=[4 5];
c=[-2 0 -1 0 0 0];
zjcj=c(BV)*A-c;
zc = [zjcj;A] %simplex_table;

simp_table=array2table(zc);
simp_table.Properties.VariableNames(1:size(zc,2))= {'x1','x2','x3','s1','s2','solu'};

RUN=true
while(RUN)
sol=A(:,end)
if any(sol<0)
    [leaving_val,pvt_row]=min(sol)
    for i=1:size(A,2)-1
        if A(pvt_row,i)<0
            ratio(i)=abs(zjcj(i)/A(pvt_row,i))
        else
            ratio(i)=inf;
        end
    end
    [enter_val,pvt_col]=min(ratio)
    BV(pvt_row)=pvt_col
    pvt_key=A(pvt_row,pvt_col)
    A(pvt_row,:)=A(pvt_row,:)/pvt_key
    for i=1:size(A,1)
        if i~=pvt_row
            A(i,:)=A(i,:)-A(i,pvt_col)*A(pvt_row,:)
        end
    end
    zjcj=zjcj-zjcj(pvt_col)*A(pvt_row,:)
zc=[zjcj; A]
else
    RUN=false
end
end
simp_table=array2table(zc)
simp_table.Properties.VariableNames(1:size(zc,2))= {'x1','x2','x3','s1','s2','solu'}