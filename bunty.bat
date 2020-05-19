@echo off
setlocal enableextensions enabledelayedexpansion

set commands = webp2 rename printpaths
goto %1

:: convert webp2 files to desired format.
:: syntax - webp2 png after cd into the directory
:webp2
if "%~2"=="" (
	echo Do you want me to convert webp file to your XXX format??? AEHO!!!!
	exit /b
)
for /r %%f in (*) do (
		dwebp "%%f" -nofilter -o "%%~dpnf.%~2"
	)
exit /b

:: rename all files with given string and increment
:rename
if "%~2"=="" (
	echo Idiot enter all required parameters!!!
	exit /b
)
for /r %%f in (*."%~2") do (
		set /a iter += 1
		ren "%%f" %~3-!iter!.*
		rem echo %~3-!iter!.%~2
	)
exit /b

:printpaths
set iter=0
for /r %%f in (*) do (
	set "file=%%f"
	set file=!file:\=/!
	echo !file! >> paths.txt
)
exit /b
