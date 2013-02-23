#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

src_dir = "/usr/local/src/mysql"
install_dir = "/usr/local/mysql"


# install required packages
%w{cmake bison g++ libncurses5-dev}.each do |pkg|
  package pkg do
    action :install
  end
end


# create mysql user
bash "create mysql user" do
  code <<-EOH
    groupadd mysql
    useradd -g mysql mysql
  EOH

  not_if "grep mysql /etc/passwd"
end


# download src, and install
execute "download mysql src" do
  command "mkdir -p #{src_dir} && curl -Lsf http://mysql.he.net/Downloads/MySQL-5.6/mysql-#{node['mysql']['version']}.tar.gz |  tar xvz -C#{src_dir} --strip 1"

  not_if "which mysql"
end

execute "cmake" do
  command "cmake -DCMAKE_INSTALL_PREFIX=#{install_dir} -DMYSQL_DATADIR=#{install_dir}/data"
  cwd src_dir

  only_if do
    File.exists?(src_dir)
  end
end

execute "make" do
  command "make install"
  cwd src_dir

  only_if do
    File.exists?(src_dir)
  end
end

execute "mysql owns #{install_dir}/data" do
  command "chown -R mysql #{install_dir}/data"

  only_if do
    File.exists?(src_dir)
  end
end

execute "install db" do
  command "#{install_dir}/scripts/mysql_install_db --basedir=#{install_dir} --datadir=#{install_dir}/data --user=mysql"
  cwd install_dir

  only_if do
    File.exists?(src_dir)
  end
end

execute "copy my.cnf" do
  command "cp #{install_dir}/my.cnf /etc/"

  not_if do
    File.exists?("/etc/my.cnf")
  end
end


# cleanup
directory "#{src_dir}" do
  recursive true
  action :delete

  only_if do
    File.exists?(src_dir)
  end
end
