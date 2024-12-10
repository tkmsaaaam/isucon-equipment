#!/bin/bash
date
# pull commit
echo "------pull------"
git pull
git checkout $1
echo "commit hash:"
echo $1
git show --format='%H' --no-patch

# write webapp restart command
echo "------restart webapp------"
cd webapp/go && go build
sudo systemctl restart isucondition.go.service

# bench
# cleaup mysql log
echo "------restart mysql------"
sudo rm /var/log/mysql/mysql-slow.log
sudo mysqladmin flush-logs
sudo systemctl restart mysql

# restart nginx
echo "------restart nginx------"
sudo rm /var/log/nginx/access.log
sudo nginx -t
sudo systemctl reload nginx
