@echo off
set commands = xl2json json2xl startsonar stopsonar copy-plugin build-plugin scan-project opencsapp opensonarlogs

rem for %%1 in (xl2json json2xl) do ( goto %1)

goto %1

if "%~1"=="" (
	echo command is empty
	exit /b
)

if NOT "%~1" == "convert" (
	echo idiot, what do you want me to do
	exit /b
)

if "%~2"=="" (
	echo you are number one idiot.... you want me to convert... okay!!! but whathhhh???
	exit /b
)

for %%a in (%commands%) do(
	echo %%a
)

:openutils
subl H:\Desktop\utils
%SystemRoot%\explorer.exe H:\Desktop\utils

:xl2json
if "%~3"=="" (
	echo aho, you did not enter the file name
	exit /b
)
python %~dp0\xl2json.py %cd%\%2
exit /b

:copyplugin
echo copying dhs sonar plugin to plugins folder
rm C:\Users\xxxxxx\sonarqube-7.4\extensions\plugins\dhs-sonar*.jar
cp \\MGMT.local\Data\Users-SDLC-Pit\xxxxxx\Desktop\myprojects\sonarabap\plugins\sonar-abap6\sonar-abap-plugin\target\dhs-sonar-abap-plugin-1.0.jar C:\Users\xxxxxx\sonarqube-7.4\extensions\plugins\dhs-sonar-abap-plugin-1.0.jar
icacls "C:\Users\xxxxxx\sonarqube-7.4\extensions\plugins\dhs-sonar-abap-plugin-1.0.jar" /grant SYSTEM:(OI)(CI)F
icacls "C:\Users\xxxxxx\sonarqube-7.4\extensions\plugins\dhs-sonar-abap-plugin-1.0.jar" /grant Administrators:(OI)(CI)F
exit /b

:buildplugin
mvn -f H:\Desktop\myprojects\sonarabap\plugins\sonar-abap6 clean package
exit /b

:scanproject
sonar-scanner -D project.settings=H:\Desktop\myprojects\sonarabap\testfolder\sonar-project.properties
exit /b

:opencsapp
subl C:\Users\xxxxxx\eclipse-workspace\ycrm_bupa_cs3
%SystemRoot%/explorer.exe C:\Users\xxxxxx\eclipse-workspace\ycrm_bupa_cs3
exit /b

:stopsonar
C:\Users\xxxxxx\sonarqube-7.4\bin\windows-x86-64\StopNTService.bat
exit /b

:startsonar
echo Starting sonar...
rm C:\Users\xxxxxx\sonarqube-7.4\logs\*.*
C:\Users\xxxxxx\sonarqube-7.4\bin\windows-x86-64\StartNTService.bat
exit /b

:opensonarlogs
subl C:\Users\xxxxxx\sonarqube-7.4\logs
%SystemRoot%\explorer.exe C:\Users\xxxxxx\sonarqube-7.4\logs

:opensonarplugins
%SystemRoot%\explorer.exe C:\Users\xxxxxx\sonarqube-7.4\extensions\plugins

:genui5doc
python H:\Desktop\myprojects\python-utils\ui5extract\generatedocuments.py
exit /b

:sublplugin
subl H:\Desktop\myprojects\sonarabap\SonarJS-master\SonarJS-master
subl H:\Desktop\myprojects\sonarabap\plugins\sonar-abap6
exit /b

:openpynotes
start /B "jupyternotes" jupyter notebook
exit /B

:listoffiles
dir /s /p /B %2 > %3
exit /B

:createfiles
for /F "tokens=*" %%A in (%CD%\%2) do echo '' > %%A
