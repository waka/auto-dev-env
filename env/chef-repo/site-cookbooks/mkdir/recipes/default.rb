#
# Cookbook Name:: mkdir
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create directory for SCM
directory "#{node['user']['home']}/repos" do
  owner node['user']['name']
  group node['user']['group']
  mode 00755
  action :create
end
directory "#{node['user']['home']}/repos/vim" do
  owner node['user']['name']
  group node['user']['group']
  mode 00755
  action :create
end
directory "#{node['user']['home']}/repos/ruby" do
  owner node['user']['name']
  group node['user']['group']
  mode 00755
  action :create
end

# create directory for tmp files
directory "#{node['user']['home']}/tmp" do
  owner node['user']['name']
  group node['user']['group']
  mode 00755
  action :create
end
