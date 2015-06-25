%% Triangle Response of LR lowpass
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $
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
t=[0: Ts: 6]; 

%ploting
plot(t,tri_res1,'--',t,tri_res2,'-',t,tri_res3,':','LineWidth',1.5);
axis([0 2 0 1])
xlabel('Time [t]');ylabel('r_{\Delta}');title('Response on Triangle Signal')
legend('\Delta=0.005','\Delta=0.05','\Delta=0.25')