execute "set-keyboard" do
  command %Q(setxkbmap -model pc105 -layout de -variant basic)
end
package "fonts-inconsolata"

# remove cache
execute "aptitude clean"
