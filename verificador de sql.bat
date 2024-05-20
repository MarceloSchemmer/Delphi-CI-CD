@echo off
setlocal enabledelayedexpansion

rem Define o padrão a ser procurado
set "pattern=select\s+\*\s+from"

rem Define o arquivo de log
set "logfile=verificacao_sql_log.txt"

rem Limpa o conteúdo do arquivo de log se já existir
echo. > %logfile%

rem Obtém a lista de arquivos modificados no commit
for /f "delims=" %%f in ('git diff --cached --name-only') do (
    set "file=%%f"
    
    rem Verifica se o arquivo contém o padrão usando PowerShell
    powershell -Command "
    $pattern = '%pattern%'
    if (Get-Content -Path '%%f' | Select-String -Pattern $pattern) {
        Write-Host 'Erro: O arquivo %%f contém um comando SQL com SELECT *'
        exit 1
    }
    " >> %logfile% 2>&1 || (
        echo Erro: O arquivo %%f contém um comando SQL com SELECT * >> %logfile%
        echo Erro: O arquivo %%f contém um comando SQL com SELECT *
        echo.
        exit /b 1
    )
)

echo Verificação concluída com sucesso. Nenhum comando SQL com SELECT * encontrado. >> %logfile%
echo Verificação concluída com sucesso. Nenhum comando SQL com SELECT * encontrado.
echo.
exit /b 0
