@echo off
setlocal enabledelayedexpansion
set "diretorio=%~dp0"
for %%F in ("%diretorio%\*.pas") do (
    rem Use o comando FINDSTR para verificar se o arquivo contém a string
    findstr /C:"SELECT * FROM" "%%F" >nul
    if !errorlevel! equ 0 (
        echo O arquivo %%~nxF contem a string "SELECT * FROM".
    )
)
