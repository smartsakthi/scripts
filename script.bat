@echo off
start chrome "https://knome.ultimatix.net/media_files/3233755/download"

@echo off
set /p assetid=Enter the system asset id:
wmic computersystem where name="%computername%" call rename name= "%assetid%"
pause 5

@echo off
setlocal
cd /d %~dp0
Call :UnZipFile "C:\Temp\" "C:\Users\Administrator\Downloads\TCS_AADP_06-12-2022.zip"
exit /b


:UnZipFile <-- ExtractTo -- > newzipfile ---
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%



call C:\Temp\TCS_AADP_06-12-2022\TCS_AADP_06-12-2022.ppkg

:deleting old file--->
del C:\Users\Administrator\Downloads\TCS_AADP_06-12-2022.zip

:del script file-->
del C:\Users\Administrator\script.bat
