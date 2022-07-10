#!/bin/sh
# pre bench
# cleaup mysql log
sudo rm /var/log/mysql/mysql-slow.log
sudo mysqladmin flush-logs

# restart nginx
sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx
# run bench before pull commit
git checkout main
# write run bench command


# output alp
sudo cat /var/log/nginx/access.log | alp ltsv

# output mysql log
sudo mysqldumpslow /var/log/mysql/mysql-slow.log
sudo pt-query-digest /var/log/mysql/mysql-slow.log


# pull commit
git pull
git checkout $1

# post bench
# cleaup mysql log
sudo rm /var/log/mysql/mysql-slow.log
sudo mysqladmin flush-logs

# restart nginx
sudo rm /var/log/nginx/access.log && sudo systemctl reload nginx

# write webapp restart command
sudo systemctl restart isucondition.go.service

# write sql restart command
sudo systemctl restart mysql

# write run bench command


# output alp
sudo cat /var/log/nginx/access.log | alp ltsv

# output mysql log
sudo mysqldumpslow /var/log/mysql/mysql-slow.log
sudo pt-query-digest /var/log/mysql/mysql-slow.log
