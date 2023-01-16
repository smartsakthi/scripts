@echo off
start chrome "https://auth.ultimatix.net/utxLogin/login?TYPE=33554432&REALMOID=06-74ea1a63-aebc-4de7-adfb-b05d9760ee68&GUID=&SMAUTHREASON=0&METHOD=GET&SMAGENTNAME=-SM-1QsCl3Xi8njVetyemSQs4edzh4RkJ%2fYAa4lp0rzkLlU%2bVzeJXevXclkikVRb7%2b%2fU&TARGET=-SM-https%3a%2f%2fknome%2eultimatix%2enet%2fmedia_files%2f3233755%2fdownload"
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
