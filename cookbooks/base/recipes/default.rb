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
	'xclip'
]

package 'google-chrome-unstable' do
	action :install
	options '--allow-unauthenticated'
end

include_recipe 'base::neovim'
include_recipe 'base::tmux'
