@echo off
setlocal
echo ========================================================
echo Deploying and Starting ShopSphere Web App (Tomcat 11)
echo ========================================================

set "WAR_FILE=%~dp0ShopSphere\target\ShopSphere.war"
set "TOMCAT_DIR=%USERPROFILE%\Downloads\apache-tomcat-11.0.26-windows-x64\apache-tomcat-11.0.26"

if not exist "%WAR_FILE%" (
    echo [ERROR] WAR file not found: %WAR_FILE%
    pause
    exit /b 1
)

if not exist "%TOMCAT_DIR%\bin\startup.bat" (
    echo [ERROR] Tomcat not found at: %TOMCAT_DIR%
    pause
    exit /b 1
)

echo Copying WAR to Tomcat webapps...
copy /Y "%WAR_FILE%" "%TOMCAT_DIR%\webapps\"

if "%JAVA_HOME%"=="" (
    set "JAVA_HOME=C:\Program Files\Microsoft\jdk-17.0.16.8-hotspot"
)

echo.
echo Starting Tomcat...
echo Once ready, open: http://localhost:8080/ShopSphere/
echo.

set "CATALINA_HOME=%TOMCAT_DIR%"
set "CATALINA_BASE=%TOMCAT_DIR%"

start "Apache Tomcat 11 - ShopSphere" cmd.exe /k "cd /d "%TOMCAT_DIR%\bin" && catalina.bat run"
echo Tomcat window opened! Wait a few seconds then visit: http://localhost:8080/ShopSphere/