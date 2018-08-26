x_das=[]; %data assimilation solution

for j=1:length(tdata)-1 %step through every t=0.5;
    tspan=0:0.01:0,5; %time b/w data collection
    [tspan,xsol]=ode45('lor_rhs',t,x_IC,[],s,b,r);
    
    x_IC0=[xsol(end,1); xsol(end,2); xsol(end,3)] %model estimate
    x_dat=[xdata(j+1); ydata(j+1); zdata(j+1)] %data estimate
    K=s2/(s2+s3); %Kalman gain
    x_IC=x_IC0+K*(x_dat-x_IC0) %adjusted state vector
    
    x_das=[x_das; xsol(1:end-1,:)]; %store the data  
end

x_das=[x_das; xsol(end,:)]; %store last data time
