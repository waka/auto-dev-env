#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install required packages
%w{zlib1g-dev libssl-dev libreadline-dev libsqlite3-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

# ruby-build
git "/tmp/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
end
bash "install-rubybuild" do
  code <<-EOC
    cd /tmp/ruby-build
    ./install.sh
  EOC

  not_if 'which ruby-build'
end

# rbenv
git node['user']['home'] + "/.rbenv" do
  user node['user']['name']
  group node['user']['group']
  repository "https://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
end
bash "rbenv" do
  user node['user']['name']
  group node['user']['group'] 
  cwd node['user']['home']
  environment "HOME" => node['user']['home']

  code <<-EOH
    source ~/.zshrc
    rbenv install #{node['rbenv']['version']}
    rbenv global #{node['rbenv']['version']}
    rbenv versions
    rbenv rehash
  EOH

  not_if {
    File.exists?(node['user']['home'] + "/.rbenv/shims/ruby")
  }
end
