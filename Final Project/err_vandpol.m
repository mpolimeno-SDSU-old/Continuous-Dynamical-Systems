%s2=[0.01 1]; %error variance
s2=.15;
%x-dynamics
% for jj = 1:length(s2)   
%         x_IC = x0+s2(jj).*randn(1,2); %perturbed initial condition
%         [t,xsol]=ode45('vandpol',t,x_IC,[],mu);
%         x=xsol(:,1);%projected x values
%         plot(t,x,'o'), hold on
% end
   
x_IC = x0+s2.*randn(1,2); %perturbed initial condition
[t,xsol]=ode45('vandpol',t,x_IC,[],mu);
x=xsol(:,1);%projected x values
plot(t,x,'o'), hold on

figure(1)
plot(t,x_true,'k','Linewidth',3), hold off
xlabel t; ylabel x;
legend('\sigma_{2}=.15','Unperturbed Solution','Interpreter',...
    'latex','location','best')
title('Van der Pol Equation with perturbed initial conditions - x solution')

%uncomment for y-dynamics
% %y-dynamics
% for j = 1:length(s2)   
%         x_IC = x0+s2(j).*randn(1,2); %perturbed initial condition
%         [t,xsol]=ode45('vandpol',t,x_IC,[],mu);
%         y=xsol(:,2);%projected y values
%         plot(t,y,'o'), hold on
% end
% 
% figure(2)
% plot(t,y_true,'k','Linewidth',3), hold off
% xlabel t; ylabel y;
% legend('\sigma_{2}=0.1', '\sigma_{2}=1','Analytical Solution','Interpreter',...
%     'latex','location','best')
% title('Van der Pol Equation with perturbed initial conditions - x solution')