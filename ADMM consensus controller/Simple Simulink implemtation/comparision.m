consensusUall=out.logsout{12}.Values.data; 
index=1;
load("matlabConsensusU.mat")
xUsedMatlab=xUsed(:,:); 
clear xUsed 


for i=1:c.Nu*c.Nc
     xUsedSimulink(i)=consensusUall(i,index);
     index=index+1;
     if index==c.Nu+1  
         index=1; 
     end 
end
xUsedSimulink=xUsedSimulink'; 
close all 
clf 
hold on 
plot(xUsedSimulink) 

plot(xUsedMatlab) 

hold off 
legend('Simulink','Matlab')