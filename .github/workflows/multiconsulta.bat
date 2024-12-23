@echo on
setlocal
set HOST=192.168.62.49
set PORT=5433
set DATABASE=REPV150
set USERDB=postgres
set PGPASSWORD=admin

REM Solicitar la sentencia SQL al usuario
set /p sql_query=Ingrese la sentencia SQL: 

REM Obtener el directorio del archivo .bat
set SCRIPT_DIR=C:\Users\ELIZABETH LEON\Documents
set SCRIPT_DIR2=C:\Program Files\PostgreSQL\13\bin

REM Crear un archivo temporal para la consulta SQL
echo %sql_query% > "%SCRIPT_DIR%\temp_query.sql"

REM Establecer la variable de entorno para la contraseña
set "PGPASSWORD=%PGPASSWORD%"

REM Ejecutar la consulta y guardar el resultado en un archivo CSV
"C:\Program Files\PostgreSQL\13\bin\psql" -h %HOST% -p %PORT% -d %DATABASE% -U %USERDB% -f "%SCRIPT_DIR%\temp_query.sql" -o "%SCRIPT_DIR%\query_result.csv"

REM Eliminar el archivo temporal
del "%SCRIPT_DIR%\temp_query.sql"

pause
endlocal
