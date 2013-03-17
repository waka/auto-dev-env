# auto-dev-env

vagrantとchef-soloを使って、Ubuntu12.10の開発環境の構築を自動化。

### あらかじめ必要なもの

* VirtualBox
* rake
* bundler
* rake
* vagrant

```sh
gem install bundler
gem install rake
gem install vagrant
```

### インストールされるもの

* language-pack-ja
* curl
* zsh
* screen
* git
* dotfiles(zshrc, screenrc, vimrc, gitconfig)
* vim-scripts(neocomplecache, minibufexpl, vim-rails, vim-markdown, vim-ragtag, railscasts)
* rbenv, ruby-build
* ruby-2.0.0-p0
* nodebrew
* node-0.10.0
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
$ rake create
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
作成ユーザーや各種ソフトのバージョンを変えたいときは、chef-repo/node/192.168.50.2.jsonを編集する。  
Net::SSH::HostKeyMismatchが起きた場合、~/.ssh/known_hostsから以前のfingerprintを削除する。
