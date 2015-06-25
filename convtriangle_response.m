%Form a new input signal as the convolution of two triangles
convtriangle1=conv(triangle1,triangle1)*Ts;
convtriangle2=conv(triangle2,triangle2)*Ts;
convtriangle3=conv(triangle3,triangle3)*Ts;

%Simulate the system by convoluting its Transferfunction with the input
%signals 
convtri_res1=Ts*conv(convtriangle1,h);
convtri_res2=Ts*conv(convtriangle2,h);
convtri_res3=Ts*conv(convtriangle3,h);

%New time axis after the convolution
t=[0: Ts: 10]; 

%ploting
plot(t,convtri_res1,'--',t,convtri_res2,'-',t,convtri_res3,':','LineWidth',1.5);
axis([0 2 0 1])
xlabel('Time [t]');ylabel('r_{\Delta}');title('System Response on the Convolution of Two Triangles')
legend('\Delta=0.005','\Delta=0.05','\Delta=0.25')