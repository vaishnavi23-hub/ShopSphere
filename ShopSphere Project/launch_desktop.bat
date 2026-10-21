@echo off
setlocal
echo ========================================================
echo Starting ShopSphere Desktop Swing App...
echo ========================================================

set "PROJECT_DIR=%~dp0ShopSphere"
cd /d "%PROJECT_DIR%"

set "JAVA_BIN=C:\Program Files\Microsoft\jdk-17.0.16.8-hotspot\bin\java.exe"
if not exist "%JAVA_BIN%" (
    set "JAVA_BIN=C:\Program Files\Java\jdk-17\bin\java.exe"
)
if not exist "%JAVA_BIN%" (
    set "JAVA_BIN=java"
)

set "CP=target\classes;target\ShopSphere\WEB-INF\lib\*"

echo Launching Swing UI...
start "ShopSphere Desktop Admin Suite" "%JAVA_BIN%" -cp "%CP%" com.shopsphere.desktop.SwingInventoryViewer

echo Application launched!