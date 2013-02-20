#
# Cookbook Name:: cleanup
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# delete bash files
file "#{node['user']['home']}/.bash_history" do
  action :delete
end
file "#{node['user']['home']}/.bash_logout" do
  action :delete
end
file "#{node['user']['home']}/.bashrc" do
  action :delete
end

# delete post install files
file "#{node['user']['home']}/postinstall.sh" do
  action :delete
end
file "#{node['user']['home']}/install.sh" do
  action :delete
end

# delete mysql src
directory "/usr/local/src/mysql" do
  recursive true
  action :delete
end

# delete local directories
directory "/usr/local/etc" do
  recursive true
  action :delete
end
directory "/usr/local/games" do
  recursive true
  action :delete
end
