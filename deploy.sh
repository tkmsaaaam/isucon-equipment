#!/bin/sh
# pull commit
git pull
git checkout $1

# write webapp restart command
cd webapp/go && go build
sudo systemctl restart isucondition.go.service

# bench
# cleaup mysql log
sudo rm /var/log/mysql/mysql-slow.log
sudo mysqladmin flush-logs
sudo systemctl restart mysql

# restart nginx
sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx

# write run bench command


# output alp
sudo cat /var/log/nginx/access.log | alp ltsv

# output mysql log
sudo mysqldumpslow /var/log/mysql/mysql-slow.log
sudo pt-query-digest /var/log/mysql/mysql-slow.log
