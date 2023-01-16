@echo off
start chrome "https://auth.ultimatix.net/utxLogin/login?TYPE=33554432&REALMOID=06-0005cbf9-05e3-1493-8ac8-00017f0080aa&GUID=&SMAUTHREASON=0&METHOD=GET&SMAGENTNAME=-SM-uaBJs2KTiPcJ%2fsp56Jc%2bt3KYc5WRwp0PuqpjcxK4RigEhqhZi1WYLpfQmwSmRMcn&TARGET=-SM-https%3a%2f%2fknowmax3%2eultimatix%2enet%2fcorpsites%2fWintelEUCSDImage%2fTCS%20OS%20Images%2f0000%2fTCS_AADP_06--12--2022%2ezip"
pause 5

@echo off
setlocal
cd /d %~dp0
Call :UnZipFile "C:\Temp\" "C:\Administrators\Downloads\TCS_AADP_06-12-2022.zip"
exit /b


:UnZipFile <ExtractTo> <newzipfile>
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

:deleting old file
del C:\Administrators\Downloads\TCS_AADP_06-12-2022.zip

:del script file
del C:\Administrators\Downloads\script.bat
