#!/bin/bash

date

# output alp
sudo cat /var/log/nginx/access.log | alp ltsv -m ""
# -m "/api/user/[0-9]+/delete,/api/user/[0-9]+"

# output mysql log
sudo mysqldumpslow /var/log/mysql/mysql-slow.log
sudo pt-query-digest /var/log/mysql/mysql-slow.log
