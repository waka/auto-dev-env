#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ruby_build_dir = "/tmp/ruby-build"
rbenv_dir = "#{node['user']['home']}/.rbenv"


# install required packages
%w{zlib1g-dev libssl-dev libreadline-dev libsqlite3-dev}.each do |pkg|
  package pkg do
    action :install
  end
end


# ruby-build
git ruby_build_dir do
  repository "https://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout

  not_if 'which ruby-build'
end
bash "install rubybuild" do
  code <<-EOC
    cd #{ruby_build_dir}
    ./install.sh
  EOC

  not_if 'which ruby-build'
end
directory ruby_build_dir do
  recursive true
  action :delete

  only_if do
    File.exists?(ruby_build_dir)
  end
end


# rbenv
git rbenv_dir do
  user node['user']['name']
  group node['user']['group']
  repository "https://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout

  not_if do
    File.exists?(rbenv_dir)
  end
end

# install ruby
bash "install ruby using rbenv" do
  user node['user']['name']
  group node['user']['group'] 
  cwd node['user']['home']
  environment "HOME" => node['user']['home']

  code <<-EOH
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> #{node['user']['home']}/.bashrc
    echo 'eval "$(rbenv init -)"' >> #{node['user']['home']}/.bashrc
    source #{node['user']['home']}/.bashrc
    #{rbenv_dir}/bin/rbenv install #{node['rbenv']['version']}
    #{rbenv_dir}/bin/rbenv global #{node['rbenv']['version']}
    #{rbenv_dir}/bin/rbenv versions
    #{rbenv_dir}/bin/rbenv rehash
  EOH

  not_if do
    File.exists?("#{rbenv_dir}/shims/ruby")
  end
end
