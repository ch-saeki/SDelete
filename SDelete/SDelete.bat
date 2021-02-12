@echo off
cd %~dp0 
echo 開始時刻 %date% %time%
 
if %PROCESSOR_ARCHITECTURE% equ x86   set SETUPFILE=sdelete.exe
if %PROCESSOR_ARCHITECTURE% equ AMD64 set SETUPFILE=sdelete64.exe
if NOT EXIST %SETUPFILE% echo bit判定不可のため終了 & goto :END

echo ゼロフィルするドライブ文字を入力してください
SET DRIVESTR=
SET /P DRIVESTR=

SET CDRIVE=C
if /i %DRIVESTR%==%CDRIVE% ( echo  Cドライブは対象外です & goto :END)
if exist %DRIVESTR%: ( %SETUPFILE% -p 3 -z %DRIVESTR%: ) else ( echo ドライブ%DRIVESTR%が存在しません & goto :END )

:END
echo 終了時刻 %date% %time%
pause
