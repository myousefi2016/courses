figure(1);
 data=load('argon_108velscale.dat');
 data1=load('argon_108buck200.dat');
 subplot(2,2,1); plot(data(:,1),data(:,2),data1(:,1),data1(:,2)); grid on; xlabel('Timestep');ylabel('Temperature');
 subplot(2,2,2); plot(data(:,1),data(:,3),data1(:,1),data1(:,3)); grid on; xlabel('Timestep');ylabel('Kinetic energy');
 subplot(2,2,3); plot(data(:,1),data(:,4),data1(:,1),data1(:,4)); grid on; xlabel('Timestep');ylabel('Potential energy');
 subplot(2,2,4); plot(data(:,1),data(:,5),data1(:,1),data1(:,5)); grid on; xlabel('Timestep');ylabel('Total energy');
print('-dpsc','partbf.eps');
%legend('Input Pos','Random Pos');
