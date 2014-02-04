packages = %w(curl ruby-dev exuberant-ctags ack-grep)
packages.each do |pkg|
  package pkg do
    action :install
  end
end

user = 'vagrant'

git "/home/#{user}/.yadr" do
  repository "https://github.com/skwp/dotfiles.git"
  reference "master"
  user user
  group user
  action :sync
  not_if { ::File.exists?("/home/#{user}/.yadr")
end

cookbook_file "create-vimrc-after" do
  path   "/home/#{user}/.vimrc.after"
  source "vimrc.after"
  owner  user
  group  user
end

cookbook_file "create-vundle-local" do
  path   "/home/#{user}/.yadr/vim/.vundles.local"
  source "vundle.local"
  owner  user
  group  user
end

directory "/home/#{user}/.zsh.after" do
  owner  user
  group  user
end

cookbook_file "create-prompt-zsh" do
  path   "/home/#{user}/.zsh.after/prompt.zsh"
  source "prompt.zsh"
  owner  user
  group  user
end

cookbook_file "create-gvim-rc" do
  path   "/home/#{user}/.gvimrc"
  source "gvimrc"
  owner  user
  group  user
end
