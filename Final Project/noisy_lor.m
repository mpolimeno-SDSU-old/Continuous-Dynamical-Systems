%noisy observation every t=0.5

tdata=t(1:50:end);
n=length(tdata);

xn=randn(n,1);
yn=randn(n,1);
zn=randn(n,1);

% x=xsol(:,1); 
% y=xsol(:,2); 
% z=xsol(:,3);

s3=4; %error variance in data

xdata=x_true(1:50:end)+s3*xn;
ydata=y_true(1:50:end)+s3*yn;
zdata=z_true(1:50:end)+s3*zn;


%[t,xsol]=ode45('lor_rhs',t,x_IC,[],s,b,r); %perturbed IC
plot(t,x_true,'b'), hold on
plot(tdata,xdata,'o'),hold off
xlabel t; ylabel x;
title('Perturbed Observations with $\sigma_{3}=1$','interpreter','latex')
