cookbook_file "keyboard" do
  path "/etc/default/keyboard"
end

cookbook_file "locale" do
  path "/etc/default/locale"
end

package "fonts-inconsolata"

# remove cache
execute "aptitude clean"
