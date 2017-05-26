@echo off
cls
set script=%~dp0ImagePrep.ps1
echo Start Image Prep Script...
powershell.exe -executionpolicy bypass "&'%script%'"
echo:
pause
