%noisy observation every t=0.5

tdata=t(1:10:end);
n=length(tdata);

xn=randn(n,1);
yn=randn(n,1);

x=xsol(:,1); 
y=xsol(:,2); 

%s3=[0.01 1]; %error variance in data
s3=.15;
%perturbed observations
xdata=x(1:10:end)+s3.*xn;
ydata=y(1:10:end)+s3.*yn;
% x2data=x(1:50:end)+s3(:,2).*xn;
% y2data=y(1:50:end)+s3(:,2).*yn;


[t,xsol]=ode45('vandpol',t,x_IC,[],mu); %unperturbed IC

%plot the x-dynamics
figure(1)
% subplot(3,1,1)
% plot(t,x_true,'b'), hold on
% plot(tdata,xdata,'ro'),hold off
% pbaspect([2 1 1])%makes x-axis twice the y-axis
% xlabel t; ylabel x;
% title('Perturbed observations for $\sigma_{3}=0.01$','interpreter','latex')
% legend('Analytical Solution','Perturbed Observations','location','BestOutside')
% subplot(3,1,1)
plot(t,x,'b'), hold on
plot(tdata,xdata,'ro'),hold off
% pbaspect([2 1 1]) %makes x-axis twice the y-axis
xlabel t; ylabel x;
title('Perturbed observations for $\sigma_{3}=1$','interpreter','latex')
legend('Analytical Solution','Perturbed Observations','location','BestOutside')

%plot the y-dynamics
figure(2)
% subplot(3,1,2)
plot(t,y_true,'b'), hold on
plot(tdata,ydata,'ro'),hold off
% pbaspect([2 1 1])%makes x-axis twice the y-axis
xlabel t; ylabel y;
title('Perturbed observations for $\sigma_{3}=0.01$','interpreter','latex')
legend('Analytical Solution','Perturbed Observations','location','BestOutside')
% subplot(3,1,2)
% plot(t,y_true,'b'), hold on
% plot(tdata,y2data,'ro'),hold off
% pbaspect([2 1 1]) %makes x-axis twice the y-axis
% xlabel t; ylabel y;
% title('Perturbed observations for $\sigma_{3}=1$','interpreter','latex')
% legend('Analytical Solution','Perturbed Observations','location','BestOutside')