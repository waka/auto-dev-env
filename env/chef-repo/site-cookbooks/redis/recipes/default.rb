#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

install_dir = "/usr/local/redis"


execute "download redis" do
  command "mkdir -p #{install_dir} && curl -Lsf http://redis.googlecode.com/files/redis-#{node['redis']['version']}.tar.gz |  tar xvz -C#{install_dir} --strip 1"
end

execute "make" do
  command "make"
  cwd install_dir
end

# copy conf file
template "#{install_dir}/redis.conf" do
  source "redis.conf.erb"
  mode 0644
end
