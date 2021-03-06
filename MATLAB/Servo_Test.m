% Clear Workspace
clear; 
% Set connection; Make sure to check the port number
% Include the Servo Motor Library
a = arduino( 'COM7', 'Mega2560', 'Libraries', 'Servo')
% Create a servo object
s = servo(a, 'D4','MinPulseDuration',.45e-3, 'MaxPulseDuration', 2.45e-3)
% The pulse width given on the datasheet forSG90 seems to be off
% I acquried the above data by trial and error

for angle = 0:0.1:1
    writePosition(s, angle);
    current_pos = readPosition(s);
    current_pos = current_pos*180;
    fprintf('Current motor position is %d degrees\n', current_pos);
    pause(2);
end
%{
Change the shaft position of the servo motor from 
0(minimum) to 1(maximum) with 0.1, e.g 18 degrees, increment. 
Display the current position each time the position changes.
%}