## Notes on Using MATLAB to Control Arduino and Servo Motors
### Check Connection between Arduino and Computer
1. Install MATLAB Support Package for Arduino Hardware (Run the script; if you do not have the required extension package, MATLAB will inform you to install it)
2. For unoffical boards, set "a = arduino(port,board)" to connect the board to MATLAB. Check Device Manager - Ports (COM & LPT) list to determine the exact port connection.
3. Run the script, Blink.m; you should see that the on-board LED near port 13 starts to blink.
### Check Connection between Arduino and Servo
1. Connect an FS5106B servo motor to Arduino hardware,
    - Connect the power wire (usually red) to the 5V pin.
    - Connect the ground wire (usually black) to the ground pin.
    - Connect the signal wire (usually orange) to a digital pin.
2. Include the servo library and set the pin and the pulse width based on the model of the servo motor
3. Run the script; the terminal should provide the current postion of the servo motor
### Reference 
[MATLAB Tutorial on Arduino] https://www.mathworks.com/help/supportpkg/arduinoio/get-started-with-matlab-support-package-for-arduino-hardware.html