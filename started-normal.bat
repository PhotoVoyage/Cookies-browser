@echo off

rem Set the path to the Node.js script (you can change it as needed)
set NODE_SCRIPT=index.js

rem Check if Node.js is installed and get its path
for /f "tokens=* USEBACKQ" %%F in (`where node`) do (
    set NODE_PATH=%%F
)

rem Check if Node.js is installed
if "%NODE_PATH%"=="" (
    echo Error: Node.js is not installed on this system.
    exit /b 1
)

rem Check if the Node.js script exists
if not exist "%NODE_SCRIPT%" (
    echo Error: The file %NODE_SCRIPT% does not exist.
    exit /b 1
)

rem Run the Node.js script
echo Running %NODE_SCRIPT%...
"%NODE_PATH%" "%NODE_SCRIPT%"

rem Check the exit code of Node.js
if %errorlevel% neq 0 (
    echo Error: %NODE_SCRIPT% exited with an invalid exit code.
    exit /b %errorlevel%
)

echo %NODE_SCRIPT% completed successfully.
exit /b 0
