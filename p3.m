l1=[5 5 6];
l2=[1 3 5 7 8];
l3=[2 3 5 9];
gama=0.5;
r=0.1*ones(1,3);
R(1,1:3)=r;
s8=2;s9=3;
sumr=[sum(r(s1)) sum(r(s2)) sum(r(s3)) sum(r(s4)) sum(r(s5)) sum(r(s6)) sum(r(s7)) sum(r(s8)) sum(r(s9))];
pl=1./((c-sumr).^2);
PL(1,1:9)=pl;
price=[sum(pl(l1)) sum(pl(l2)) sum(pl(l3))];
R(2,1:3)=r;
for i=2:100
gama=1/(i+1);
sumr=[sum(r(s1)) sum(r(s2)) sum(r(s3)) sum(r(s4)) sum(r(s5)) sum(r(s6)) sum(r(s7)) sum(r(s8)) sum(r(s9))];
pl=1./((c-sumr).^2);
PL(i,1:9)=pl;
price=[sum(pl(l1)) sum(pl(l2)) sum(pl(l3))];
r=r+gama*r.*(1./(r)-price);
R(i,1:3)=r;
end
rate_session1=R(1:100,1)';
rate_session2=R(1:100,2)';
rate_session3=R(1:100,3)';
i=1:100;
plot(i,rate_session1,'r')
hold on
plot(i,rate_session2,'b.-')
hold on
plot(i,rate_session3,'b')
grid on
axis ([0 50 0 1])
c1=R(100,1);
c2=R(100,2);
c3=R(100,3);
id=F*[c1 c2 c3]';
if id<=transpose(c)
valid=1;
else
valid=0;
end
id
r0=id;
rate=[c1 c2 c3]'