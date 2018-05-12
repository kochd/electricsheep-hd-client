title Electric Sheep HD daemon
cd %~p0
set PATH=%SYSTEMROOT%\system32;%cd%\contrib\bin
ruby daemon %* || pause
