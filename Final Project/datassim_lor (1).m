% clear all
% clc
% 
% t=0:0.01:20;
% s=10;
% b=8/3;
% r=28;
% 
% x0=[5 5 5];
% [t,xsol]=ode45('lor_rhs',t,x0,[],s,b,r);
% 
% %noisy observation every t=0.5
% 
% tdata=t(1:50:end);
% n=length(tdata);
% 
% xn=randn(n,1);
% yn=randn(n,1);
% zn=randn(n,1);
% 
% x=xsol(:,1); 
% y=xsol(:,2); 
% z=xsol(:,3);
% 
% s3=1; %error variance in data
% 
% xdata=x(1:50:end)+s3*xn;
% ydata=y(1:50:end)+s3*yn;
% zdata=z(1:50:end)+s3*zn;
% 
% s2=1; %error variance
% x_IC = x0+s2*randn(1,3); %perturbed initial condition
% [t,xsol]=ode45('lor_rhs',t,x_IC,[],s,b,r);

x_da=[]; %data assimilation solution
for j=1:length(tdata)-1 %step through every t=0.5;
    tspan=0:0.01:0.5; %time b/w data collection
    [tspan,xsol]=ode45('lor_rhs',tspan,x_IC,[],s,b,r);
    
    x_IC0=[xsol(end,1); xsol(end,2); xsol(end,3)]; %model estimate
    x_dat=[xdata(j+1); ydata(j+1); zdata(j+1)]; %data estimate
    K=s2/(s2+s3); %Kalman gain %s2=s3=1
    x_IC=x_IC0+K*(x_dat-x_IC0); %adjusted state vector
    
    x_da=[x_da; xsol(1:end-1,:)]; %store the data  
end
x_da=[x_da; xsol(end,:)]; %store last data time
x_dax=x_da(:,1);

figure(1)
plot(t,x,'b'), hold on
plot(tdata,xdata,'ko'), hold on
plot(t,x_dax,'r'),hold off
pbaspect([2 1 1]) %makes x-axis twice the y-axis
xlabel t; ylabel x;
legend('Analytical Solution','Data','Data Assimilation Solution')
title('Data Assimilation')

%error b/w solution and model prediction
%error b/w solution and data assimilation technique
for j = 1:length(t)
    Edat(j,:) = abs((x(j,:)-x_dax(j,:)));
    errdat(j) = (sum(Edat(j,:))).^2;
end

figure(2)
plot(t,errdat,'b-')
pbaspect([2 1 1])
xlabel('Time')
ylabel('L_{2} Norm')
title('Error Dynamics - Data Assimilation')
grid on