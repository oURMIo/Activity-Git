@echo off
set REPO_PATH=.\
set FILE_NAME=simple-file.txt
set FILE_PATH=%REPO_PATH%\%FILE_NAME%

if not exist %REPO_PATH%\.git (
    echo Ошибка: Репозиторий не найден в указанном пути.
    exit /b 1
)

if not exist %FILE_PATH% (
    echo Ошибка: Файл %FILE_NAME% не найден в репозитории.
    exit /b 1
)

:loop
set /a RANDOM_NUMBER=%random%10%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%

set /p LAST_LINE=<%FILE_PATH%

echo %LAST_LINE% %RANDOM_NUMBER% >> %FILE_PATH%

git -C %REPO_PATH% add %FILE_NAME%
git -C %REPO_PATH% commit -m "Add new symbol"

git -C %REPO_PATH% push origin master

timeout /t 60 /nobreak >nul

goto loop
