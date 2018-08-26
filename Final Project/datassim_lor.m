x_da=[]; %data assimilation solution
% x_ICk = x0+s2*randn(1,3);
for j=1:length(tdata)-1 %step through every t=0.5;
    tspan=0:0.01:0.5; %time b/w data collection
    [tspan,xsol]=ode45('lor_rhs',tspan,x_IC,[],s,b,r);
    
    x_IC0=[xsol(end,1); xsol(end,2); xsol(end,3)]; %model estimate
    x_dat=[xdata(j+1); ydata(j+1); zdata(j+1)]; %data estimate
    K=s2^2/(s2^2+s3^2); %Kalman gain %s2=s3=1
    x_IC=x_IC0+K*(x_dat-x_IC0); %adjusted state vector
    
    x_da=[x_da; xsol(1:end-1,:)]; %store the data  
end
x_da=[x_da; xsol(end,:)]; %store last data time
x_dax=x_da(:,1);

figure(1)
plot(t,x_true,'b',t,x_dax,'r','linewidth',2.5), hold on
%plot(tdata,xdata,'ko','linewidth',1.5), hold on
%plot(t,x_dax,'r','linewidth',2.5),hold off
%pbaspect([2 1 1]) %makes x-axis twice the y-axis
xlabel t; ylabel x;
legend('Analytical Solution','Data Assimilation Solution')
title('Data Assimilation')

%error b/w solution and model prediction
%error b/w solution and data assimilation technique
% for j = 1:length(t)
%     Edat(j,:) = abs((x_true(j,:)-x_dax(j,:)));
%     errdat(j) = (sum(Edat(j,:))).^2;
% end
% 
% figure(2)
% plot(t,errdat,'b-')
% pbaspect([2 1 1])
% xlabel('Time')
% ylabel('SSE')
% title('Error Dynamics - Data Assimilation')
% grid on