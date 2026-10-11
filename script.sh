#!/bin/bash
# Мониторинг ресурсов: раз в N секунд пишет free, df и uptime в monitor.log

N=10
LOG=monitor.log

while true
do
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> $LOG
    free -h >> $LOG
    df -h >> $LOG
    uptime >> $LOG
    sleep $N
done

