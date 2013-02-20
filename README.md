# auto-dev-env

vagrantとchef-soloを使って、Ubuntu12.10の開発環境の構築を自動化。

### あらかじめ必要なもの

* VirtualBox
* bundler
* vagrant

### インストールされるもの

以下、インストール順。

* language-pack-ja
* zsh
* curl
* screen
* git
* dotfiles(zshrc, screenrc, vimrc, gitconfig)
* vim-scripts
* rbenv
* nodebrew
* mysql-5.6
* redis-2.6
* mongodb-2.2


## 使い方

```sh
$ git clone https://github.com/waka/auto-dev-env.git
$ cd auto-dev-env
```

### boxファイルを作る

```sh
$ cd ubuntu-box
$ rake box
```

'ubuntu-12.10'という名前でvagrantにboxが追加される。

### 各種環境のインストール、セットアップ

```sh
$ cd env
$ vagrant up
$ rake setup
$ vagrant ssh
```

zshへの変更はログインしてからchsh（cookbookでやるとssh認証でこけるので）。  
作成ユーザーや各種サーバーのバージョンを変えたいときは、chef-repo/node/192.168.50.2.jsonを編集する。  
Net::SSH::HostKeyMismatchが起きた場合、~/.ssh/known_hostsから以前のfingerprintを削除する。
