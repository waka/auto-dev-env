#
# Cookbook Name:: nodebrew
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# nodebrew
bash "nodebrew" do
  user node['user']['name']
  group node['user']['group'] 
  cwd node['user']['home']
  environment "HOME" => node['user']['home']

  code <<-EOH
    curl https://raw.github.com/hokaccha/nodebrew/master/nodebrew | perl - setup
    echo 'PATH="$HOME/.nodebrew/current/bin:$PATH"' >> ~/.bashrc
    #{node['user']['home']}/.nodebrew/current/bin/nodebrew install-binary #{node['nodebrew']['version']}
    #{node['user']['home']}/.nodebrew/current/bin/nodebrew use #{node['nodebrew']['version']}
  EOH

  not_if {
    File.exists?(node['user']['home'] + "/.nodebrew/nodebrew")
  }
end
