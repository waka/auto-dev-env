#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# clone or checkout
git "#{node['user']['home']}/repos/dotfiles" do
  repository "https://github.com/waka/dotfiles.git"
  reference "master"
  action :checkout
  user node['user']['name']
  group node['user']['group']
end

# ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
link "#{node['user']['home']}/.zshrc" do
  to "#{node['user']['home']}/repos/dotfiles/.zshrc"
  owner node['user']['name']
  group node['user']['group']
end

# ln -s ~/repos/dotfiles/.screenrc ~/.screenrc
link "#{node['user']['home']}/.screenrc" do
  to "#{node['user']['home']}/repos/dotfiles/.screenrc"
  owner node['user']['name']
  group node['user']['group']
end

# ln -s ~/repos/dotfiles/.vimrc ~/.vimrc
link "#{node['user']['home']}/.vimrc" do
  to "#{node['user']['home']}/repos/dotfiles/.vimrc"
  owner node['user']['name']
  group node['user']['group']
end

# ln -s ~/repos/dotfiles/.gitconfig ~/.gitconfig
link "#{node['user']['home']}/.gitconfig" do
  to "#{node['user']['home']}/repos/dotfiles/.gitconfig"
  owner node['user']['name']
  group node['user']['group']
end
