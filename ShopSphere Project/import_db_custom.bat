@echo off
setlocal
echo Importing ShopSphere Database...
set "MYSQL=C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"
set "SQL_FILE=%~dp0ShopSphere\database\shopsphere.sql"

"%MYSQL%" -u root -proot -e "SET FOREIGN_KEY_CHECKS=0; DROP DATABASE IF EXISTS shopsphere; SET FOREIGN_KEY_CHECKS=1;"
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Could not connect to MySQL. Check service and password.
    exit /b 1
)
echo Old database dropped. Importing fresh...
"%MYSQL%" -u root -proot < "%SQL_FILE%"
if %ERRORLEVEL% equ 0 (
    echo [SUCCESS] Database 'shopsphere' imported successfully!
) else (
    echo [ERROR] Database import failed.
    exit /b 1
)