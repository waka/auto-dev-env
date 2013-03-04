#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

dotfiles_dir = "#{node['user']['home']}/repos/dotfiles"


# clone or checkout
git dotfiles_dir do
  repository "https://github.com/waka/dotfiles.git"
  reference "master"
  action :checkout
  user node['user']['name']
  group node['user']['group']

  not_if {
    File.exists?(dotfiles_dir)
  }
end

# ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
link "#{node['user']['home']}/.zshrc" do
  to "#{dotfiles_dir}/.zshrc"
  owner node['user']['name']
  group node['user']['group']

  not_if {
    File.exists?(node['user']['home'] + "/.zshrc")
  }
end

# ln -s ~/repos/dotfiles/.screenrc ~/.screenrc
link "#{node['user']['home']}/.screenrc" do
  to "#{dotfiles_dir}/.screenrc"
  owner node['user']['name']
  group node['user']['group']

  not_if {
    File.exists?(node['user']['home'] + "/.screenrc")
  }
end

# ln -s ~/repos/dotfiles/.vimrc ~/.vimrc
link "#{node['user']['home']}/.vimrc" do
  to "#{dotfiles_dir}/.vimrc"
  owner node['user']['name']
  group node['user']['group']

  not_if {
    File.exists?(node['user']['home'] + "/.vimrc")
  }
end

# ln -s ~/repos/dotfiles/.gitconfig ~/.gitconfig
link "#{node['user']['home']}/.gitconfig" do
  to "#{dotfiles_dir}/.gitconfig"
  owner node['user']['name']
  group node['user']['group']

  not_if {
    File.exists?(node['user']['home'] + "/.gitconfig")
  }
end
