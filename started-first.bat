@echo off
npm i
node index.js
ping 127.0.0.1 -n 5 > nul
del /f /q started-first.bat
