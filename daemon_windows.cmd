title Electric Sheep HD daemon
cd %~p0
set PATH=%SYSTEMROOT%\system32;%cd%\git+flam3+ruby\bin
ruby daemon %* || pause
