#!/bin/sh

cd

echo -e "\nFetching latest access log...\n"

ssh root@159.203.130.33 'cp /var/log/nginx/access.log ~/ && chmod 755 ~/access.log'

echo "get access.log" | sftp root@159.203.130.33

echo -e "\nCleaning up...\n"

ssh root@159.203.130.33 'rm ~/access.log'

echo -e "Playing log...\n"

logstalgia -1280x720 ~/access.log
