s2=1; %error variance

for j=1:8
    x_IC = x0+s2*randn(1,3); %perturb initial condition
    [t,xsol]=ode45('lor_rhs',t,x_IC,[],s,b,r);
    x=xsol(:,1); %projected x values
    subplot(4,2,j), plot(t,x_true,'r'), hold on
    plot(t,x,'b'), hold off
end