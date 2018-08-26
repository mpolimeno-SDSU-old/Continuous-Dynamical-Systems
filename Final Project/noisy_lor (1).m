%noisy observation every t=0.5

tdata=t(1:50:end);
n=length(tdata);

xn=randn(n,1);
yn=randn(n,1);
zn=randn(n,1);

x=xsol(:,1); 
y=xsol(:,2); 
z=xsol(:,3);

s3=1; %error variance in data

xdata=x(1:50:end)+s3*xn;
ydata=y(1:50:end)+s3*yn;
zdata=z(1:50:end)+s3*zn;


[t,xsol]=ode45('lor_rhs',t,x0,[],s,b,r); %unperturbed IC
figure(1)
subplot(3,1,1)
plot(t,x_true,'b'), hold on
plot(tdata,xdata,'r'),hold off
xlabel t; ylabel x;
title('Perturbed Observations with $\sigma_{3}=1$','interpreter','latex')
