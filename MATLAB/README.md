## Notes on Using MATLAB to Control Arduino and Servo Motors
### Check Connection
1. Install MATLAB Support Package for Arduino Hardware (Run the script; if you do not have the required extension package, MATLAB will inform you to install it)
2. For unoffical boards, set "a = arduino(port,board)" to connect the board to MATLAB. Check Device Manager - Ports (COM & LPT) list to determine the exact port connection.
3. Run the script, Blink.m; you should see that the on-board LED near port 13 starts to blink.