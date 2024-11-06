#!/bin/bash

REPO_PATH="."
FILE_NAME="simple-file.txt"
FILE_PATH="$REPO_PATH/$FILE_NAME"

if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Ошибка: Репозиторий не найден в указанном пути."
    exit 1
fi

if [ ! -f "$FILE_PATH" ]; then
    echo "Ошибка: Файл $FILE_NAME не найден в репозитории."
    exit 1
fi

while true; do

    CURRENT_HOUR=$(date +"%H")
    CURRENT_MINUTE=$(date +"%M")

    if ( [ "$CURRENT_HOUR" -eq 9 ] && [ "$CURRENT_MINUTE" -ge 25 ] ) || 
       ( [ "$CURRENT_HOUR" -eq 10 ] && [ "$CURRENT_MINUTE" -le 35 ] ) || 
       ( [ "$CURRENT_HOUR" -eq 19 ] && [ "$CURRENT_MINUTE" -ge 25 ] ) || 
       ( [ "$CURRENT_HOUR" -eq 20 ] && [ "$CURRENT_MINUTE" -le 35 ] ); then

        RANDOM_NUMBER=$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM

        LAST_LINE=$(tail -n 1 "$FILE_PATH")

        echo "$LAST_LINE $RANDOM_NUMBER" >> "$FILE_PATH"

        git -C "$REPO_PATH" add "$FILE_NAME"
        git -C "$REPO_PATH" commit -m "Add new symbol"
        git -C "$REPO_PATH" push origin master

        sleep 3600 * 4
    fi

    sleep 3600
done

