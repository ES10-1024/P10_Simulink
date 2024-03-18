%% Describtion
% This short script is utilized to run the simulink simulation  
%% Making alot of clears 
clf 
clc 
clear
%% Adding path and standard values
addpath('Functions\')
c=standardConstants; 
%% 
c.Tsim='24*3600'; 
c.tsSim=num2str(c.ts*3600); 

simData=sim('GlobalMPC.slx',"StartTime",'0',"StopTime",c.Tsim,'FixedStep',c.tsSim);

%% 
clf
%Makign a plot of the volume
V=simData.logsout{2}.Values.Data;
hold on 
plot(V)
yline(c.hmax*c.At)
yline(c.hmin*c.At)
hold off 
ylabel('Volume [m^{3}]')
xlabel('Samples [*]')
grid on
ylim([220 600])
legend('Volume','Constraints')
