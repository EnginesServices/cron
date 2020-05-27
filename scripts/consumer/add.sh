#!/bin/sh
. /home/engines/functions/checks.sh\r\nrequired_values=\"cron_job when title parent_engine container_type\"\r\ncheck_required_values\r\n\r\n\r\nmkdir -p /home/cron/entries/${parent_engine}/$title\r\n\r\nif test  ${container_type} = app\r\n then\r\n \tcontainer_type=engine\r\nfi\r\n\r\necho -n $container_type > /home/cron/entries/${parent_engine}/$title/container_type\r\necho -n $action_type > /home/cron/entries/${parent_engine}/$title/action_type\r\necho -n $notification_address > /home/cron/entries/${parent_engine}/$title/notification_address\r\necho -n \"$when\" > /home/cron/entries/${parent_engine}/$title/when\r\n\r\nif test $action_type = \"web\"\r\n then\r\n    cmd=\"curl http://${parent_engine}.engines.internal:8000$cron_job\"\r\nelif test $action_type = \"command\"\r\n then\r\n \tcmd=\"curl -k https://172.17.0.1:2380/v0/cron/engine/${parent_engine}/$title/run\"\r\nelif test $action_type = \"schedule\"\r\n then\r\n    cmd=\"curl -k  https://172.17.0.1:2380/v0/schedule/${container_type}/${parent_engine}/$cron_job\"\r\nelif test $action_type = \"action\"\r\n then\r\n    cmd=\"curl -k https://172.17.0.1:2380/v0/schedule/${container_type}/${parent_engine}/$title/run\"\r\nfi\r\n\r\necho -n \"$cmd \" > /home/cron/entries/${parent_engine}/$title/cmd\r\necho -n \"$title\" > /home/cron/entries/${parent_engine}/$title/title\r\n\r\n/home/engines/scripts/engine/rebuild_crontab.sh\r\n\r\necho \"Success\"\r\nexit 0
