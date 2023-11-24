# 当日の流れ

- マニュアル、レギュレーションを読む
- サーバーの状態を知る
  - [init.sh](init.sh)
- ベンチの実行
- Git
  - <https://github.com/settings/keys>
  - <https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account>
  - [config](.ssh/config)
  - [.gitignore](.gitignore_example)

  ```bash
  cd $HOME/.ssh
  ssh-keygen -t ed25519
  cat $HOME/.ssh/github.pub
  # https://github.com/settings/keys
  vi $HOME/.ssh/config
  ssh -T git@github.com -i $HOME/.ssh/github
  git init
  git config --global user.email ""
  git config --global user.name ""
  git remote add origin git@github.com:hoge/fuga.git
  # `.gitignore_example` をルートに設置
  git add
  git commit -m “initial commit”
  git push -u origin main
  git clone
  ```

- bacup

  ```bash
    mkdir $HOME/.backup
    mkdir $HOME/.tmp
    scp -r isucon@ubuntu-focal:~/ ~/codes/isucon
  ```

- mysql
  - [my.cnf](mysql/my.cnf)

  ```bash
    mkdir $HOME/.backup/mysql
    sudo cp /etc/mysql/my.cnf $HOME/.backup/mysql/my.cnf
    sudo vi /etc/mysql/my.cnf
    sudo vi /etc/my.cnf
    sudo systemctl restart mysql
  ```

- nginx
  - [nginx.conf](nginx/nginx.conf)

  ```bash
    mkdir $HOME/.backup/nginx
    sudo cp /etc/nginx/nginx.conf $HOME/.backup/nginx/nginx.conf
    sudo rm /etc/nginx/nginx.conf
    mkdir $HOME/webapp/nginx
    cp $HOME/.backup/nginx/nginx.conf $HOME/webapp/nginx/nginx.conf
    sudo ln -s $HOME/webapp/nginx/nginx.conf /etc/nginx/nginx.conf
    sudo vi $HOME/webapp/nginx/nginx.conf
    sudo systemctl reload nginx
  ```

- 設定の確認

  ```bash
    sudo ls /usr/lib/systemd/system
    sudo ls /etc/systemd/system
    sudo cat path/name.service
  ```

- tools
  - [setup.sh](setup.sh)
- configファイルなどはシンボリックリンクにし、実態はリポジトリ内におく
  - ln -s 実態 リンク
  - 作成前に元のファイルのバックアップやコピーを取ることを忘れない
- 指標の確認、修正
- deploy
  - [deploy.sh](deploy.sh)
- logs

  ```bash
  sudo tail -n 100 /var/log/syslog
  sudo tail -n 100 /var/log/mysql/error.log
  sudo journalctl -u nginx.service
  ```
