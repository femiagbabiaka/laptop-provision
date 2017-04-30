package 'neovim'

execute 'python2.7 provider' do
	command '/usr/bin/pip install neovim'
	not_if 'pip list | grep neovim'
end

execute 'python3 provider' do
	command '/usr/bin/pip3 install neovim'
	not_if 'pip3 list | grep neovim'
end

execute 'ruby provider' do
	command '/usr/bin/gem install neovim'
	not_if '/usr/bin/gem list --local | grep neovim'
end
