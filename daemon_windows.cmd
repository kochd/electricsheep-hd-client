title Electric Sheep HD daemon
CD /D %~dp0
SET PATH=%SYSTEMROOT%\system32;%CD%\contrib\bin
ruby daemon %* || pause
