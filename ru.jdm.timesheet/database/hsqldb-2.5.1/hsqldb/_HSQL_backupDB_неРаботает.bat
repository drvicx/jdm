@echo off

REM Backup one database
set HOST=127.0.0.1
set DBN=timesheet

rem set BDIR="C:\Program Files\Java\hsqldb-2.5.1\hsqldb\backups\"
set BDIR="C:/Program Files/Java/hsqldb-2.5.1/hsqldb/_backups/"
set URL=jdbc:hsqldb:hsql://%HOST%/%DBN%,User=SA,Password=
set JAR="C:\Program Files\Java\hsqldb-2.5.1\hsqldb\lib\sqltool.jar"

set CMD="BACKUP DATABASE TO '%BDIR%' BLOCKING AS FILES;"

C:
cd %BDIR%
rem del %DBN%.*
java.exe -jar %JAR% --sql %CMD%  --inlineRC url=%URL%

pause