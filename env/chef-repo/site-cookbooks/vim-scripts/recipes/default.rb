#
# Cookbook Name:: vim-scripts
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

repoDir = "#{node['user']['home']}/repos/vim"
destDir = "#{node['user']['home']}/.vim"


# mkdir .vim
directory "#{node['user']['home']}/.vim" do
  owner node['user']['name']
  group node['user']['group']
  mode 00755
  action :create
end

# neocomplcache
git "#{repoDir}/neocomplcache" do
  repository "https://github.com/Shougo/neocomplcache.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{autoload plugin vest}.each do |dir|
  srcDir = "#{repoDir}/neocomplcache/#{dir}"
  execute "copy neocomplcache" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{srcDir} #{destDir}"
    action :run
  end
end

# minibufexpl
git "#{repoDir}/minibufexpl" do
  repository "https://github.com/fholgado/minibufexpl.vim.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{plugin}.each do |dir|
  srcDir = "#{repoDir}/minibufexpl/#{dir}"
  execute "copy minibufexpl" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{srcDir} #{destDir}"
    action :run
  end
end

# vim-rails
git "#{repoDir}/vim-rails" do
  repository "https://github.com/tpope/vim-rails.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{autoload plugin}.each do |dir|
  srcDir = "#{repoDir}/vim-rails/#{dir}"
  execute "copy vim-rails" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{srcDir} #{destDir}"
    action :run
  end
end

# vim-markdown
git "#{repoDir}/vim-markdown" do
  repository "https://github.com/plasticboy/vim-markdown.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{after ftdetect syntax}.each do |dir|
  srcDir = "#{repoDir}/vim-markdown/#{dir}"
  execute "copy vim-markdown" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{srcDir} #{destDir}"
    action :run
  end
end

# vim-ragtag
git "#{repoDir}/vim-ragtag" do
  repository "https://github.com/tpope/vim-ragtag.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{plugin}.each do |dir|
  srcDir = "#{repoDir}/vim-ragtag/#{dir}"
  execute "copy vim-ragtag" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{srcDir} #{destDir}"
    action :run
  end
end

# Railscasts-Theme-GUIand256color
git "#{repoDir}/Railscasts-Theme-GUIand256color" do
  repository "https://github.com/vim-scripts/Railscasts-Theme-GUIand256color.git"
  reference "master"
  action :sync
  user node['user']['name']
  group node['user']['group']
end
%w{colors}.each do |dir|
  srcDir = "#{repoDir}/Railscasts-Theme-GUIand256color/#{dir}"
  execute "copy railscasts" do
    user node['user']['name']
    group node['user']['group']
    command "cp -r #{srcDir} #{destDir}"
    action :run
  end
end
