#!/bin/sh

cron_list_file=`mktemp`\r\n /home/cron/bin/fcrontab -l | sed \"/*/s//STAR/g\"  > $cron_list_file\r\nfirst=1\r\necho '{\"cron_jobs\":['\r\ncat $cron_list_file | while read LINE\r\ndo\r\nif test $first -eq 1\r\n then\r\n  first=0\r\nelse\r\n echo -n \",\"\r\nfi\r\ncront=`echo \"$LINE\" | cut -f1-5 -d\" \"`\r\ncronl=`echo \"$LINE\" | cut -f6- -d\" \"`\r\ntim=`echo $cront | sed \"/STAR/s//*/g\"`\r\necho '{\"command\":\"'$cronl'\",\r\n\t\t\"when\":\"'\"$tim\"'\"}'\r\n\r\ndone\r\necho ']}'\r\n\r\n\r\nrm $cron_list_file
