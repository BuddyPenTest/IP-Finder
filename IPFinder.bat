@echo off
title IP Logger - by Buddy
color2
:: Set the folder name
set folder=IPs

:: Create the folder if it doesn't exist
if not exist "%folder%" mkdir "%folder%"

:: Ask for the filename
set /p filename=Enter the name of the text file (e.g., myip.txt): 

echo Recording your IP, please wait...

:: Grab the IPv4 address and save with date/time
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    for /f "tokens=* delims= " %%b in ("%%a") do (
        echo Date: %date% Time: %time% - IP: %%b >> "%folder%\%filename%"
        echo Your current IP is: %%b
    )
)

echo.
echo Your IP has been saved to %folder%\%filename%
pause
