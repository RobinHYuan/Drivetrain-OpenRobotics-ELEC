clear a; % Clear Workspace
a = arduino( 'COM7', 'Mega2560'); %Set connection; Make sureto check the port number
while true
    writeDigitalPin(a, 'D13', 0);
    pause(2);
    writeDigitalPin(a, 'D13', 1);
    pause(2);
end


