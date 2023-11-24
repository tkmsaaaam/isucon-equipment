#!/bin/bash
# pull commit
echo "------pull------"
git pull
git checkout $1

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
sudo systemctl reload nginx

# write run bench command


# output alp
sudo cat /var/log/nginx/access.log | alp ltsv -m ""
# -m "/api/user/[0-9]+/delete,/api/user/[0-9]+"

# output mysql log
sudo mysqldumpslow /var/log/mysql/mysql-slow.log
sudo pt-query-digest /var/log/mysql/mysql-slow.log
