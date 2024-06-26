function constants = scaled_standard_constants()
  %% Constraints   
%Define the minimum and maximum amount each pump are allowed to pump during a day
constants.TdMin1=0;
constants.TdMin2=0;
constants.TdMin3=0;

constants.TdMax1=0.6; 
constants.TdMax2=0.6;
%constants.TdMax3=400; 

%Defining pressure before the pumps [Pa]: 
constants.p10=0;%101325; 
constants.p20=0;%101325; 
constants.p30=0;%101325;

% Define max mass flow for each pump (m^3/h) 
constants.umax1=0.05; 
constants.umax2=0.05;


% Defining minimum mass flow for each pump (m^3/h)
constants.umin1=0; 
constants.umin2=0;


%Define minimum and maximum height in the water tower later calcuated to volumen [m]
constants.hmin=0.1; 
constants.hmax=0.55; 

constants.Vmin=28/1000; 
constants.Vmax=155/1000; 

%% Constant model values 
% area of the water tower 
constants.At=0.283; 

%Defining rho (density of water in m^3/kg)  
constants.rhoW=997;

% Defining gravitational acceleration m/s^s 
constants.g0=9.82; 

%Defining effeciny of the 3 pumps 
constants.e1=1.1; %To Be Updated!
constants.e2=1.3; %To Be Updated!


% Defining pipe resistance  (stupied units so not included here
constants.rf1=0.3*10^5; 
constants.rf2=0.1*10^5; 

%Defining ressistance after 
constants.rfTogether = 0.3*10^5; 

% Defining pipe elevation In meters
constants.z1=2; 
constants.z2=1.5;

%Amount of pumps
constants.Nu=2; 
%Amount of demands
constants.Nd=1;

%% Initial values
%initial water level [m]
constants.h=0.2; 
%Inital volumen [m^c]
%constants.V=constants.h*constants.At; 
constants.V=56/1000;
%% noise for consumpition model
constants.NoiseMean=0; 
constants.NoiseVariance=4; 

%% MPC tuning parameter


%Defining wired K in the cost function
constants.K=1/3600;  %To Be Updated!

%Weight for the price term
constants.Kp=1; 

%Setting sampletime in hours
constants.ts=1; 

% Defining control horizion in hours 
constants.Nc_hours = 24; %To Be Updated!

% Defining control horizion in samples 
%constants.Nc = constants.Nc_hours*3600/constants.ts; 
constants.Nc = 24; 

%Defining accelerated time (amount of accelered hour in one real world hour 
constants.AccTime=6; 
%% Variables defining for the consensus algortime 
%Defining amount of iteration that the consensus ADMM should do 
constants.iteration=300;

constants.rho=0.08;

end