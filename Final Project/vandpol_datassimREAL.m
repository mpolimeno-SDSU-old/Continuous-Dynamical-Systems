clear all
clc

t=0:0.01:20;
mu=3;

x0=[1 1];
[t,xsol]=ode45('vandpol',t,x0,[],mu);

x_true=xsol(:,1); 
y_true=xsol(:,2); 


% figure(1)
% rotate3d on
% plot3(x_true,y_true,z_true);
% grid on

s2=1; %error variance

for j=1:8
    x_IC = x0+s2*randn(1,2); %perturbed initial condition
    [t,xsol]=ode45('vandpol',t,x_IC,[],mu);
    x=xsol(:,1);
    figure(1)%projected x values 
    subplot(4,2,j), plot(t,x_true,'b'),hold on
    plot(t,x,'r'), hold off
end

%noisy observation every t=0.5

tdata=t(1:50:end);
n=length(tdata);

xn=randn(n,1);
yn=randn(n,1);

% x=xsol(:,1); 
% y=xsol(:,2); 
% z=xsol(:,3);

s3=4; %error variance in data

xdata=x_true(1:50:end)+s3*xn;
ydata=y_true(1:50:end)+s3*yn;


%[t,xsol]=ode45('lor_rhs',t,x_IC,[],s,b,r); %perturbed IC
figure(2)
plot(t,x_true,'b'), hold on
plot(tdata,xdata,'o'),hold off
xlabel t; ylabel x;

x_da=[]; %data assimilation solution
for j=1:length(tdata)-1 %step through every t=0.5;
    tspan=0:0.01:0.5; %time b/w data collection
    [tspan,xsol]=ode45('vandpol',tspan,x_IC,[],mu);
    
    x_IC0=[xsol(end,1); xsol(end,2)]; %model estimate
    x_dat=[xdata(j+1); ydata(j+1)]; %data estimate
    K=s2^2/(s2^2+s3^2); %Kalman gain %s2=s3=1
    x_IC=x_IC0+K*(x_dat-x_IC0); %adjusted state vector
    
    x_da=[x_da; xsol(1:end-1,:)]; %store the data  
end
x_da=[x_da; xsol(end,:)]; %store last data time
x_dax=x_da(:,1);

figure(3)
plot(t,x_true,'b',t,x_dax,'r',tdata,xdata,'ko','linewidth',2.5), hold on
xlabel t; ylabel x;
legend('Analytical Solution','Data Assimilation Solution','Noisy Data')
title('Data Assimilation')