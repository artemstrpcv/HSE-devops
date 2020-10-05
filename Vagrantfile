Vagrant.configure("2") do |config|
  
config.vm.box = "hashicorp/bionic64"
config.vm.box_check_update = false

config.vm.network "forwarded_port", guest: 80, host: 80
config.vm.network :forwarded_port, guest: 443, host: 443

config.vm.provision :shell, path: "init.sh"

end

