#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

install_dir = "/usr/local/mongodb"


execute "download mongodb" do
  command "mkdir -p #{install_dir} && curl -Lsf http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-#{node['mongodb']['version']}.tgz |  tar xvz -C#{install_dir} --strip 1"
end


# copy conf file
template "#{install_dir}/mongodb.conf" do
  source "mongodb.conf.erb"
  mode 0644
end
