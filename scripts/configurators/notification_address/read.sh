#!/bin/sh

if test -f /home/engines/scripts/configurators/saved/notifcation_address\r\n then\r\n  addr=`cat /home/engines/scripts/configurators/saved/default_notifcation_address`\r\nelse\r\n addr=Not Set\r\nfi\r\n\r\necho '{\"notification_address\":\"'$addr'\"}'\r\n\r\nexit 0
