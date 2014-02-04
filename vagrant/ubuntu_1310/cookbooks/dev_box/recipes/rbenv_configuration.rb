user = 'vagrant'

execute "add-rbenv-export-path-config-to-zshrc" do
  command %Q(echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> /home/#{user}/.zshenv)

  only_if { ::Dir.exists?("/home/#{user}/.rbenv") }
  not_if  { ::File.exists?("/home/#{user}/.zshenv") && ::File.open("/home/#{user}/.zshenv").readlines.select{|line| line =~ /rbenv\/bin/}.any? }
end

execute "add-rbenv-init-config-to-zshrc" do
  command %Q(echo 'eval "$(rbenv init -)"' >> /home/#{user}/.zshenv)

  only_if { ::Dir.exists?("/home/#{user}/.rbenv") }
  not_if  { ::File.exists?("/home/#{user}/.zshenv") && ::File.open("/home/#{user}/.zshenv").readlines.select{|line| line =~ /rbenv init/}.any? }
end
