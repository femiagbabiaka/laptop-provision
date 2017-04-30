package 'tmux'

template '/home/miatomi/.tmux.conf' do
	source 'tmux.conf.erb'
	owner 'miatomi'
	group 'miatomi'
	mode '0755'
end
