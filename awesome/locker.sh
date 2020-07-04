#!/bin/sh

exec xautolock -detectsleep 
  -time 2 -locker "/home/aswin/i3lock-color/lock.sh" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
