@echo off
setlocal enabledelayedexpansion
set "diretorio=C:\Users\marce\OneDrive\Documentos\GitHub\Delphi-CI-CD"
for %%F in ("%diretorio%\*.pas") do (
    findstr /C:"SELECT * FROM" "%%F" >nul
    if !errorlevel! equ 0 (
        echo O arquivo %%~nxF contem a string "SELECT * FROM".
	exit /b 1
    )
)