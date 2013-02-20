#
# Cookbook Name:: zsh
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install
package "zsh" do
  action :install
end

# change default shell to zsh
user "#{node['user']['name']}" do
  gid 999
  home "#{node['user']['home']}"
  shell "/bin/zsh"
  password "$1$gSwroAKg$pGE0loBLoWBtKEfsd4KxD."
  supports :manage_home => true
end
