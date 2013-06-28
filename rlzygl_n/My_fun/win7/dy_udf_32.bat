@echo off
REM Changing working folder back to current directory
%~d0
CD %~dp0
REM Folder changed

REM Check first if Windows XP
for /f "tokens=3*" %%i IN ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName ^| Find "ProductName"') DO set vers=%%i %%j 
echo %vers% | find "XP" > nul
if %ERRORLEVEL% == 0 goto ver_xp
 

REM Ask for admin access
if exist "admincheckOK.txt" goto adminOK1
del /Q admincheckOK.vbs 2> nul
echo.Set objShell = CreateObject("Shell.Application") > admincheckOK.vbs
echo.Set FSO = CreateObject("Scripting.FileSystemObject") >> admincheckOK.vbs
echo.strPath = FSO.GetParentFolderName (WScript.ScriptFullName) >> admincheckOK.vbs
echo.If FSO.FileExists(%0) Then >> admincheckOK.vbs
echo. Dim oShell >> admincheckOK.vbs
echo. Set oShell = WScript.CreateObject ("WScript.Shell") >> admincheckOK.vbs
echo. oShell.run "cmd.exe /c echo admincheckOK > admincheckOK.txt" >> admincheckOK.vbs
echo. Set oShell = Nothing >> admincheckOK.vbs
echo. objShell.ShellExecute "cmd.exe", "/s /c " ^& """"%0"""" ^& " ", "", "runas", 1 >> admincheckOK.vbs
echo.Else >> admincheckOK.vbs
echo. MsgBox "Script file not found" >> admincheckOK.vbs
echo.End If >> admincheckOK.vbs
REM =========执行前的提示，非必需============
echo 一键XX
echo =========================
echo 此文件只需要运行一次，任意键后将可能需要你点一次权限确认。
pause
REM =========提示结束============ 
cscript //B admincheckOK.vbs
goto theend
:adminOK1
del /Q admincheckOK.txt 2> nul
del /Q admincheckOK.vbs 2> nul
:ver_xp
REM Admin Access allowed
REM ============原来的bat文件内容开始==========
copy isql.exe C:\WINDOWS\system32 /y
copy My_fun.dll C:\"Program Files"\Borland\InterBase\udf\ /y
isql D:\rlzygl\Data\RYXX.GDB -u sysdba -p masterkey -i dy_udf.SQL
pause
echo 完成
REM ============内容结束======================
del /Q admincheckOK.vbs 2> nul
del /Q admincheckOK.txt 2> nul
:theend