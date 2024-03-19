%% Describtion
% This short script is utilized to run the simulink simulation  
%% Making alot of clears 
clf 
clc 
clear
%% Adding path and standard values
addpath("Global controller\Simple Simulink implemtation\Functions\")
c=standardConstants; 
%% 
simHour=48; 
simTime=simHour/c.AccTime*3600; 


c.Tsim=num2str(simTime); 
c.tsSim=num2str(c.ts*3600); 

simData=sim('GlobalMPC.slx',"StartTime",'600',"StopTime",c.Tsim,'FixedStep','200');

%% Plotting a comparision between Matlab and Simulink global implementation
clf
addpath("Global controller\Simple Simulink implemtation\Data to compare\")
load('Global controller\Simple Simulink implemtation\Data to compare\Vglobal')
%Makign a plot of the volume
V=simData.logsout{3}.Values.Data;
Vglobal=Vglobal(2:end)
hold on 
plot(V)
plot(Vglobal(2:end))
yline(c.Vmax)
yline(c.Vmin)
hold off 
ylabel('Volume [m^{3}]')
xlabel('Samples [*]')
grid on
ylim([220 600])
xlim([0 26])
legend('Simulink Volume','Matlab Volume','Constraints')
%% Plotting the input for the two different setups 
load('Global controller\Simple Simulink implemtation\Data to compare\uAllGlobal.mat')
uMatlab=uAll(:,2:end);
clear uAll 
uSimulink=simData.logsout{1}.Values.Data;
uSimulink=squeeze(uSimulink)'; 
clf
hold on 
stairs(uMatlab(1:3,:)')
stairs(uSimulink(1:3,:)')
xlim([0 48])
hold off 
%% Written up a few matrixes 
c.A_1=[];
for i=1:c.Nc
    c.A_1 = blkdiag(c.A_1,ones(1,c.Nu));
end
%Lower trangiular matrix to add consumption and inflow 
c.A_2 = tril(ones(c.Nc,c.Nc));
%Making matrix which picks out 1 of the pumps for the enitre control
%horizion
c.A_31=[];
for i=1:c.Nc
    c.A_31 = blkdiag(c.A_31,[1 0 0]);
end

c.A_32=[];
for i=1:c.Nc
    c.A_32 = blkdiag(c.A_32,[0 1 0]);
end

c.A_33=[];
for i=1:c.Nc
    c.A_33 = blkdiag(c.A_33,[0 0 1]);
end
%% 
load("dMatlab.mat")
dMatlab=squeeze(dMatlab); 

load("ElPrices.mat")


for index=1:size(uSimulink,2)
    c.d=dMatlab(:,index);
    c.Je=ElPris(:,index);
    c.V=Vglobal(index,1)
    MatlabCost(index,1)=costFunction(uMatlab(:,index),c); 
    c.V=V(index,1);
    SimulinkCost(index,1)=costFunction(uSimulink(:,index),c);
    costDifference(index,1)=MatlabCost(index,1)-SimulinkCost(index,1); 
    procentDifference(index,1)=costDifference(index,1).*inv(MatlabCost(index,1)).*100;
end 

plot(procentDifference)

