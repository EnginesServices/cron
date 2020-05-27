#!/bin/sh

PID_FILE=/home/engines/run/fcron.pid\r\nexport PID_FILE\r\n. /home/engines/functions/trap.sh\r\n\r\n/home/cron/sbin/fcron -f -p  /home/cron/log/cron.log &\r\n\r\nstartup_complete\r\n\r\nwait \r\nexit_code=$?\r\n\r\nshutdown_complete
