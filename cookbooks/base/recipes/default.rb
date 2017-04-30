apt_update 'Normal' do
	frequency 500
end

template '/etc/apt/sources.list' do
	owner 'root'
	group 'root'
	mode '0644'
	notifies :update, 'apt_update[Normal]'
end


package [
	'git',
	'sudo',
	'python-pip',
	'python3-pip',
	'bundler',
	'xclip',
	'gconf2',
	'apt-transport-https'
]

package 'google-chrome-unstable' do
	action :install
	options '--allow-unauthenticated'
end

cookbook_file '/tmp/slack-desktop-2.5.2-amd64.deb' do
	source 'slack-desktop-2.5.2-amd64.deb'
end

dpkg_package 'slack-desktop' do
	source '/tmp/slack-desktop-2.5.2-amd64.deb'
end

include_recipe 'base::neovim'
include_recipe 'base::tmux'
