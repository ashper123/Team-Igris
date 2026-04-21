@echo off
REM Setup script for Project Board on Windows

echo.
echo ====================================
echo Project Board Setup Verification
echo ====================================
echo.

REM Check Node.js
echo 1. Checking Node.js...
where node >nul 2>nul
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo    [OK] Node.js found: %NODE_VERSION%
) else (
    echo    [ERROR] Node.js not found
    echo    Install from: https://nodejs.org
    pause
    exit /b 1
)

REM Check npm
echo.
echo 2. Checking npm...
where npm >nul 2>nul
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
    echo    [OK] npm found: %NPM_VERSION%
) else (
    echo    [ERROR] npm not found
    pause
    exit /b 1
)

REM Check .env file
echo.
echo 3. Checking .env file...
if exist .env (
    echo    [OK] .env file exists
    findstr /c:"VITE_GEMINI_API_KEY" .env >nul
    if %errorlevel% equ 0 (
        echo    [OK] API key configured
    ) else (
        echo    [WARNING] API key not found in .env
    )
) else (
    echo    [ERROR] .env file not found
)

REM Check required files
echo.
echo 4. Checking required files...
if exist package.json (
    echo    [OK] package.json found
) else (
    echo    [ERROR] package.json not found
    pause
    exit /b 1
)

if exist server.js (
    echo    [OK] server.js found
) else (
    echo    [ERROR] server.js not found
    pause
    exit /b 1
)

if exist index.html (
    echo    [OK] index.html found
) else (
    echo    [ERROR] index.html not found
    pause
    exit /b 1
)

REM Final message
echo.
echo ====================================
echo [SUCCESS] All files verified!
echo ====================================
echo.
echo Next steps:
echo   1. npm install
echo   2. npm start
echo   3. Open http://localhost:3001
echo.
pause
