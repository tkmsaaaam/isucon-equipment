### 当日の流れ
- マニュアル、レギュレーションを読む
- サーバーの状態を知る
	- cat /proc/cpuinfo
  - cat /proc/meminfo
  - free -h
  - systemctl list-units --type=service --state=running
- ベンチの実行
- サーバーのバックアップをとる
  - scp -r isucon@ubuntu-focal:~/ ~/codes/isucon
- configファイルなどはシンボリックリンクにし、実態はリポジトリ内におく
	- ln -s 実態 リンク
	- 作成前に元のファイルのバックアップやコピーを取ることを忘れない
	- sudo ln -s ~/nginx.conf /etc/nginx/nginx.conf
- Git
  - git init
  - https://github.com/
  - https://github.com/settings/emails
  - git config --global user.email ""
  - git config --global user.name ""
  - git remote add origin git@github.com:hoge/fuga.git
  - `.gitignore_example` をルートに設置
  - git add
  - git commit -m “initial commit”
  - ssh-keygen
  - cat .ssh/id_rsa.pub
  - https://github.com/settings/keys
  - git push -u origin master
  - GitHubのパスワード必要
  - git clone
- 指標の確認、修正
- デプロイコマンド `deploy.sh` をルートに設置
- `setup.sh` をルートに設置し `sh setup.sh` を実行
- `sudo vi /etc/nginx/nginx.conf`
  - httpに以下を設置
  ```
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
 									'$status $body_bytes_sent "$http_referer" '
 									'"$http_user_agent" "$http_x_forwarded_for"';
  access_log  /var/log/nginx/access.log  main;
  ```
- `sudo vi /etc/my.cnf`
```
# for slow_query_log
[mysqld]
slow_query_log=1
long_query_time=0
slow_query_log_file=/var/log/mysql/mysql-slow.log
```
