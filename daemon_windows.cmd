cd %~p0
set PATH=%PATH%;%cd%\git+flam3+ruby\bin
ruby daemon %* || pause