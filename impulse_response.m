%% Impulse Response of LR lowpass
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $
syms s;
Ts=0.001;                                               % Sampling Time
t=[0: Ts: 2];                                           % Initializing Time Axis 
% L{dy(t)/dt+2y(t)=x(t)}={sY(s)+Y(s)=X(s)}=> Transfer function 
% (H(s)=Y(s)/X(s))
H=1/(s+2);                                              %Transfer function
h1=ilaplace(H);                                         %inverse Laplace
h=subs(h1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input Signal
% Form Dirac pulse approximations
dirac1=dirac__(0.005,t);
dirac2=dirac__(0.05,t);
dirac3=dirac__(0.25,t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Impulse response computation 
% convoluting Transferfunction with the formed input signals 
impulse1=Ts*conv(dirac1,h); 
impulse2=Ts*conv(dirac2,h);
impulse3=Ts*conv(dirac3,h);
t1=[0: Ts: 4];               % New time axis after the convolution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ploting
subplot(1,2,1);plot(t,dirac1,'--',t,dirac2,'-',t,dirac3,':','LineWidth',1.5);
subplot(1,2,2);plot(t1,impulse1,'--',t1,impulse2,'-',t1,impulse3,':','LineWidth',1.5);
axis([0 2 0 1])
xlabel('Time [t]');ylabel('r_{\Delta}');title('Impulse Response')
legend('\Delta=0.005','\Delta=0.05','\Delta=0.25')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Triangle Response of LR lowpass
% Form triangle signals from the convolution of the Dirac pulse 
% approximation 
triangle1=conv(dirac1,dirac1)*Ts;
triangle2=conv(dirac2,dirac2)*Ts;
triangle3=conv(dirac3,dirac3)*Ts;

%Simulate the system by convoluting its Transferfunction with the 
%input signals 
tri_res1=Ts*conv(triangle1,h);
tri_res2=Ts*conv(triangle2,h);
tri_res3=Ts*conv(triangle3,h);

%New time axis after the convolution
t2=[0: Ts: 6]; 

%ploting
subplot(1,2,1);plot(t1,triangle1,'--',t1,triangle2,'-',t1,triangle3,':','LineWidth',1.5);
subplot(1,2,2);plot(t2,tri_res1,'--',t2,tri_res2,'-',t2,tri_res3,':','LineWidth',1.5);
axis([0 2 0 1])
xlabel('Time [t]');ylabel('r_{\Delta}');title('Response on Triangle Signal')
legend('\Delta=0.005','\Delta=0.05','\Delta=0.25')

%% Form a new input signal as the convolution of two triangles
convtriangle1=conv(triangle1,triangle1)*Ts;
convtriangle2=conv(triangle2,triangle2)*Ts;
convtriangle3=conv(triangle3,triangle3)*Ts;

%Simulate the system by convoluting its Transferfunction with the input
%signals 
convtri_res1=Ts*conv(convtriangle1,h);
convtri_res2=Ts*conv(convtriangle2,h);
convtri_res3=Ts*conv(convtriangle3,h);

%New time axis after the convolution
t2=[0: Ts: 8]; 
t3=[0: Ts: 10]; 

%ploting
subplot(1,2,1);plot(t2,convtriangle1,'--',t2,convtriangle2,'-',t2,convtriangle3,':','LineWidth',1.5);
subplot(1,2,2);plot(t3,convtri_res1,'--',t3,convtri_res2,'-',t3,convtri_res3,':','LineWidth',1.5);
axis([0 2 0 1])
xlabel('Time [t]');ylabel('r_{\Delta}');title('System Response on the Convolution of Two Triangles')
legend('\Delta=0.005','\Delta=0.05','\Delta=0.25')