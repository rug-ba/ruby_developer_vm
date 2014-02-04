package "ubuntu-desktop" do
  action :install
  options "--no-install-recommends"
end

node_platform_code = case node.platform_version
                when "13.10"
                  "saucy"
                when "13.04"
                  "raring"
                when "12.10"
                  "quantal"
                when "12.04"
                  "precise"
                else
                  "notdefined"
                end

# copyg is a clipboard manager
# http://www.webupd8.org/2013/02/copyq-interesting-clipboard-manager.html

# multi-load system resources indicator
apt_repository "noobslab" do
  uri "http://ppa.launchpad.net/noobslab/indicators/ubuntu"
  distribution node_platform_code
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "F59EAE4D"
  action :add
end

# qcopy indicator
apt_repository "samrog131" do
  uri "http://ppa.launchpad.net/samrog131/ppa/ubuntu"
  distribution node_platform_code
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "2B7E03A7"
  action :add
end

e = execute "apt-get update" do
  action :nothing
end
e.run_action(:run)

packages = %w( indicator-applet-appmenu indicator-applet-session indicator-applet-complete indicator-application indicator-session indicator-sound
           indicator-multiload fonts-ubuntu-font-family-console ubuntu-private-fonts msttcorefonts
           copyq compiz-plugins-extra compizconfig-settings-manager
           language-pack-de language-pack-gnome-de
           chromium-browser
           vim-gnome
         )

if node.platform_version == '12.04'
  packages << %w( unity-place-applications unity-place-files )
end

node.default['restricted_extras'] = false
if node.restricted_extras == true
  packages << %w( ubuntu-restricted-extras )
end

# unity lenses
if node.platform_version == '13.04' or node.platform_version == '13.10'
  packages.concat( %w( unity-lens-applications unity-lens-files unity-lens-music
                       unity-lens-video unity-lens-photos unity-lens-gwibber
                       unity-lens-help indicator-bluetooth indicator-cpufreq
                       indicator-datetime indicator-network indicator-power
                       gnome-terminal
  ))
end

packages.each do |pkg|
  Chef::Log.info("Installing #{pkg}")
  package pkg do
    action :install
  end
end
