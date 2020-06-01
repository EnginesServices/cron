#!/bin/sh

#. /home/engines/functions/params_to_env.sh\r\n#params_to_env\r\n . /home/engines/functions/checks.sh\r\nrequired_values=\"title parent_engine \"\r\ncheck_required_values\r\n\r\n\r\nif test -f /home/cron/entries/${parent_engine}/$title\r\n then\r\n\trm /home/cron/entries/${parent_engine}/$title\r\n\t/home/engines/scripts/engine/rebuild_crontab.sh\r\nfi\r\n\r\necho \"Success\"\r\nexit 0
