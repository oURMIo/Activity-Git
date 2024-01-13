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
echo 1 >> %FILE_PATH%

:: Добавление изменений в репозиторий
git -C %REPO_PATH% add %FILE_NAME%
git -C %REPO_PATH% commit -m "Добавлен символ 1"

:: Пуш изменений
git -C %REPO_PATH% push origin master

:: Пауза на 60 секунд (можете изменить по своему усмотрению)
timeout /t 60 /nobreak >nul

goto loop
