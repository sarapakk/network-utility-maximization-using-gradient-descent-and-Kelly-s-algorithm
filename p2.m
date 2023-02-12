clc
close all
source=1:3;
F=[0 1 0;0 0 1;0 1 1;1 0 0;1 1 1;1 0 0;0 1 1;0 1 0;0 0 1];
c=[2 2 2 2 4 2 2 2 2];
s1=2;s2=3;s3=[2 3];s4=1;s5=[1 2 3];s6=1;s7=[2 3];s8=2;s9=3;
%%%%%
l1=[5 5 6];
l2=[1 3 5 7 8];
l3=[2 3 5 9];
alfa=1;
pl=12*ones(1,9);
PL(1,1:9)=pl;
price=[sum(pl(l1)) sum(pl(l2)) sum(pl(l3))];
rs=1./(price);
RS(1,1:3)=rs;
sum_rate=[sum(rs(s1)) sum(rs(s2)) sum(rs(s3)) sum(rs(s4)) sum(rs(s5)) sum(rs(s6)) sum(rs(s7)) sum(rs(s8)) sum(rs(s9))];
pl=pl+((alfa).*(sum_rate-c));
PL(2,1:9)=pl;

for i=2:1000
price=[sum(pl(l1)) sum(pl(l2)) sum(pl(l3))];
rs=1./(price);
RS(i,1:3)=rs;
%%%%%%%%%%%%%%%%%%%%%%%
sum_rate=[sum(rs(s1)) sum(rs(s2)) sum(rs(s3)) sum(rs(s4)) sum(rs(s5)) sum(rs(s6)) sum(rs(s7)) sum(rs(s8)) sum(rs(s9))];
pl=pl+((1/(i+1)).*(sum_rate-c));
PL(i+1,1:9)=pl;
end
rate_session1=RS(1:1000,1)';
rate_session2=RS(1:1000,2)';
rate_session3=RS(1:1000,3)';
i=1:1000;
plot(i,rate_session1,'r')
hold on
plot(i,rate_session2,'b.-')
hold on
plot(i,rate_session3,'b')
grid on

c1=RS(1000,1);
c2=RS(1000,2);
c3=RS(1000,3);
id=F*[c1 c2 c3]';
if id<=transpose(c)
t=1;
else
t=0;
end
id
t
r0=id;
rate=[c1 c2 c3]'