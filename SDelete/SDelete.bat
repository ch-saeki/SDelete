@echo off
cd %~dp0 
echo �J�n���� %date% %time%
 
if %PROCESSOR_ARCHITECTURE% equ x86   set SETUPFILE=sdelete.exe
if %PROCESSOR_ARCHITECTURE% equ AMD64 set SETUPFILE=sdelete64.exe
if NOT EXIST %SETUPFILE% echo bit����s�̂��ߏI�� & goto :END

echo �[���t�B������h���C�u��������͂��Ă�������
SET DRIVESTR=
SET /P DRIVESTR=

SET CDRIVE=C
if /i %DRIVESTR%==%CDRIVE% ( echo  C�h���C�u�͑ΏۊO�ł� & goto :END)
if exist %DRIVESTR%: ( %SETUPFILE% -p 3 -z %DRIVESTR%: ) else ( echo �h���C�u%DRIVESTR%�����݂��܂��� & goto :END )

:END
echo �I������ %date% %time%
pause
