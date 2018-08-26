clear all
clc

t=0:0.01:20;
s=10;
b=8/3;
r=28;

x0=[5 5 5];
[t,xsol]=ode45('lor_rhs',t,x0,[],s,b,r);

x_true=xsol(:,1); 
y_true=xsol(:,2); 
z_true=xsol(:,3);


figure(1)
rotate3d on
plot3(x_true,y_true,z_true);
grid on