#
# Cookbook Name:: base_packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{language-pack-ja curl zsh screen git-core}.each do |name|
  package name do
    action :install
  end
end

