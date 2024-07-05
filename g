a=[1 2;1 1;0 1]
b=[2000,1500,600]
c=[2 3]
x1=0: max(b)
x21=(b(1)-a(1,1)*x1)/a(1,2)
x22=(b(2)-a(2,1)*x1)/a(2,2)
x23=(b(3)-a(3,1)*x1)/a(3,2)
x21=max(0,x21)
x22=max(0,x22)
x23=max(0,x23)
plot(x1,x21,'g',x1,x22,'r',x1,x23,'b')
xlabel('x1')
ylabel('x2')
title('x1 vs x2')
legend('x1+2x2=2000','x1+x2=1500','x2=600')
cx1=find(x1==0)
c1=find(x21==0)
line1=[x1(:,[c1 cx1]); x21(:,[c1 cx1])]'
c2=find(x22==0)
line2=[x1(:,[c2 cx1]); x22(:,[c2 cx1])]'
c3=find(x23==0)
line3=[x1(:,[c3 cx1]); x23(:,[c3 cx1])]'
corpt=unique([line1;line2;line3],'rows')
solution=[0;0]
for i=1:size(a,1)
    a1= a(i,:)
    b1=b(i)
    for j=i+1:size(a,1)
        a2=a(j,:)
        b2=b(j)
        a3=[a1;a2]
        b3=[b1;b2]
        xx=inv(a3)*b3
        solution=[solution xx]
    end
end
pt=solution'
allpt=[pt;corpt]
points=unique(allpt,'rows')
X1=points(:,1)
X2=points(:,2)
cons1=X1+2*X2-2000
h1=find(cons1>0)
points(h1,:)=[]
X1=points(:,1)
X2=points(:,2)
cons2=X1+X2-1500
h2=find(cons2>0)
points(h2,:)=[]
X1=points(:,1)
X2=points(:,2)
cons3=X2-600
h3=find(cons3>0)
points(h3,:)=[]
PT=unique(points,'rows')
for i=1:size(PT,1)
    FX(i,:)=sum(PT(i,:).*c)
end
vert_ans=[PT FX]
[fxval indfx]=max(FX)
optval=vert_ans(indfx,:)
OPTIMAL_ANS=array2table(optval)
