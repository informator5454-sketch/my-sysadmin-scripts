#!/bin/bash
# Мониторинг ресурсов: раз в N секунд пишет free, df и uptime в monitor.log

N=10
LOG=monitor.log
if ! touch $LOG 2>/dev/null; then
    echo "Ошибка: не могу записать в $LOG"
    exit 1
fi

trap 'echo "Мониторинг остановлен, данные в $LOG"; exit 0' INT
while true
do
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> $LOG
    free -h >> $LOG
    df -h >> $LOG
    uptime >> $LOG
    sleep $N
done

