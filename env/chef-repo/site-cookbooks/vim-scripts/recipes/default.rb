#
# Cookbook Name:: vim-scripts
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

repos_dir = "#{node['user']['home']}/repos/vim"
dest_dir = "#{node['user']['home']}/.vim"


# mkdir .vim
directory dest_dir do
  owner node['user']['name']
  group node['user']['group']
  mode 00755
  action :create

  not_if {
    File.exists?(dest_dir)
  }
end

# neocomplcache
git "#{repos_dir}/neocomplcache" do
  repository "https://github.com/Shougo/neocomplcache.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{autoload plugin vest}.each do |dir|
  src_dir = "#{repos_dir}/neocomplcache/#{dir}"
  execute "copy neocomplcache" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{src_dir} #{dest_dir}"
    action :run
  end
end

# minibufexpl
git "#{repos_dir}/minibufexpl" do
  repository "https://github.com/fholgado/minibufexpl.vim.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{plugin}.each do |dir|
  src_dir = "#{repos_dir}/minibufexpl/#{dir}"
  execute "copy minibufexpl" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{src_dir} #{dest_dir}"
    action :run
  end
end

# vim-rails
git "#{repos_dir}/vim-rails" do
  repository "https://github.com/tpope/vim-rails.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{autoload plugin}.each do |dir|
  src_dir = "#{repos_dir}/vim-rails/#{dir}"
  execute "copy vim-rails" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{src_dir} #{dest_dir}"
    action :run
  end
end

# vim-markdown
git "#{repos_dir}/vim-markdown" do
  repository "https://github.com/plasticboy/vim-markdown.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{after ftdetect syntax}.each do |dir|
  src_dir = "#{repos_dir}/vim-markdown/#{dir}"
  execute "copy vim-markdown" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{src_dir} #{dest_dir}"
    action :run
  end
end

# vim-ragtag
git "#{repos_dir}/vim-ragtag" do
  repository "https://github.com/tpope/vim-ragtag.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{plugin}.each do |dir|
  src_dir = "#{repos_dir}/vim-ragtag/#{dir}"
  execute "copy vim-ragtag" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{src_dir} #{dest_dir}"
    action :run
  end
end

# Railscasts-Theme-GUIand256color
git "#{repos_dir}/Railscasts-Theme-GUIand256color" do
  repository "https://github.com/vim-scripts/Railscasts-Theme-GUIand256color.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{colors}.each do |dir|
  srcDir = "#{repos_dir}/Railscasts-Theme-GUIand256color/#{dir}"
  execute "copy railscasts" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{src_dir} #{dest_dir}"
    action :run
  end
end
