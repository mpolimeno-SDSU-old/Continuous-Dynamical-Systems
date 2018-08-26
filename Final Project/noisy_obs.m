%noisy observation every t=0.5

tdata=t(1:50:end);
n=length(tdata)

xn=randn(n,1);
yn=randn(n,1);
zn=randn(n,1);

x=xsol(:,1); 
y=xsol(:,2); 
z=xsol(:,3);

s3=4; %error variance in data

xdata=x(1:50:end)+s3*xn;
ydata=y(1:50:end)+s3*yn;
zdata=z(1:50:end)+s3*zn;


[t,xsol]=ode45('lor_rhs',t,x0,[],s,b,r); %unperturbed IC
plot(t,x_true,'b'), hold on
plot(tdata,xdata,'o'),hold off
pbaspect([2 1 1]) %makes x-axis twice the y-axis
xlabel('t');
ylabel('x');