s2=1; %error variance


x_IC = x0+s2*randn(1,3); %perturbed initial condition
[t,xsol]=ode45('lor_rhs',t,x_IC,[],s,b,r);
x=xsol(:,1); %projected x values


figure(1)
pbaspect([2 1 1])
plot(t,x,'r-'), hold on
plot(t,x_true,'b-'), hold off
xlabel t; ylabel x;
legend('Perturbation','Unperturbed IC')
title('Perturbed Initial Conditions')
