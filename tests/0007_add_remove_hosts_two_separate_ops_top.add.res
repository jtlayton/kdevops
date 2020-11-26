Host kdevops 51.179.89.243
	HostName 51.179.89.243
	User alpha
	Port 25
	IdentityFile ~alpha/.ssh/go
	UserKnownHostsFile /dev/null
	StrictHostKeyChecking no
	PasswordAuthentication no
	IdentitiesOnly yes
	LogLevel FATAL
Host kdevops-dev 52.195.142.19
	HostName 52.195.142.19
	User alpha
	Port 25
	IdentityFile ~alpha/.ssh/go
	UserKnownHostsFile /dev/null
	StrictHostKeyChecking no
	PasswordAuthentication no
	IdentitiesOnly yes
	LogLevel FATAL
Host *
	ServerAliveInterval 60
	ServerAliveCountMax 2
Host apples
	User mcgrof
	Port 22
	HostName 192.168.1.10
	IdentityFile ~/.ssh/apples
Host apples-pub
	User mcgrof
	Port 6913
	HostName 71.72.31.95
	IdentityFile ~/.ssh/apples
Host starwars
  HostName 192.168.2.92
  User vagrant
  Port 22
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/mcgrof/devel/kdevops/vagrant/.vagrant/machines/starwars/libvirt/private_key
  IdentitiesOnly yes
  LogLevel FATAL
Host starwars-dev
  HostName 192.168.2.78
  User vagrant
  Port 22
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /home/mcgrof/devel/kdevops/vagrant/.vagrant/machines/starwars-dev/libvirt/private_key
  IdentitiesOnly yes
  LogLevel FATAL
