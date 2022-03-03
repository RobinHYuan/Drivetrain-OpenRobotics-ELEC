%% -------------- Set Up --------------
    clear; clc; close all;
    sampleTime = 1e-5;
%% -------------- Parameter Assignment --------------
% Note: SI Units are Used. (V, A, Ohm, H, rad/s, kgm^2 and Nm)
    RPMtoRad = @(rpm) 2*pi*rpm/60;
    [Nominal_V, NoLoadSpeed, NoLoadCurrent] = deal(24, RPMtoRad(4360), 81.4e-3);
    [Km,Jm] = deal(51e-3,92.5e-7);  
    [Rw, Lw] = deal(4.83,2.24e-3);
    
% Dynamic Damping Factor Estimation
    NoLoadTorque  =  Km * NoLoadCurrent;
    Bm = NoLoadTorque/NoLoadSpeed; 
    
%% -------------- SimuLink Model ---------------------   
 KLoad = 0.95; MinLoadTorque = 2*NoLoadTorque;
 ExpectedSpeed = RPMtoRad(500);% Specify it in RPM
 [Kp, Ki, Kd] = deal(1,100,5e-3);
 SimulationTime = 0.02;

 ControllerPID;
 sim('ControllerPID',SimulationTime);
 
 %% ------------- Figures ---------------------------------
omegaM =ans.AngularVelocityM.Data;
t = ans.AngularVelocityM.Time;
RadtoRPM= @(rad) rad*60/(2*pi);
plot (t*1e3, RadtoRPM(omegaM),'color', 'blue','LineWidth',2.25,'LineStyle','-','DisplayName','Actual Motor Speed \omega_M');
hold on; grid on; legend();
plot (t*1e3, RadtoRPM(ExpectedSpeed)*heaviside(t),'color', 'green','LineWidth',2.5,'LineStyle','--','DisplayName','Desired Motor Speed \omega_D');
ylabel("Speed(RPM)");xlabel("Time(msec)");
title("Simulation Result");xlim([0 SimulationTime*1e3])
