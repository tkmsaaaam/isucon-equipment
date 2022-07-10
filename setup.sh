# setup alp
sudo cat /var/log/nginx/access.log
wget https://github.com/tkuchiki/alp/releases/download/v1.0.9/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo install ./alp /usr/local/bin

#setup pt-query-digest
wget https://github.com/percona/percona-toolkit/archive/refs/tags/v3.3.1.tar.gz
tar zxvf v3.3.1.tar.gz
sudo mv ./percona-toolkit-3.3.1/bin/pt-query-digest /usr/local/bin/pt-query-digest
