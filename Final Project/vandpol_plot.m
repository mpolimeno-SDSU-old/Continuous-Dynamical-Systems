clear all
clc

t=0:0.01:20;
mu=3;

x0=[1 1];
[t,xsol]=ode45('vandpol',t,x0,[],mu);

x_true=xsol(:,1); 
y_true=xsol(:,2); 


figure(1)
grid on
plot(t,x_true,'ro'), hold on
plot(t,y_true,'bo'), hold off
xlabel('t')
ylabel('Solution')
legend('X','Y')
title('Solution to the Vanderpol Equation for $\mu=3$','Interpreter','Latex')