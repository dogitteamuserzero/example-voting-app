$script = <<-PROVSCRIPT
  docker ps
PROVSCRIPT

Vagrant.configure("2") do |config|
  config.vm.boot_timeout = 900

  config.vm.define "appserver" do |appserver|
    appserver.vm.box = "gusztavvargadr/docker-linux"
	appserver.vm.hostname = "appserver"
    appserver.vm.network "private_network", ip: "172.16.2.4", virtualbox__intnet: true
	appserver.vm.network "forwarded_port", guest: 5000, host: 5000
	appserver.vm.network "forwarded_port", guest: 5001, host: 5001

	appserver.vm.provider "virtualbox" do |vb|
		vb.name = "appserver_v3"
		vb.cpus = "1"
		vb.memory = "1024"
		vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
		vb.customize ["modifyvm"     , :id, "--vram","64"]
		vb.customize ["modifyvm"     , :id, "--graphicscontroller","vmsvga"]
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end

	appserver.vm.provision "shell", run: "always", inline: $script, privileged: false
  end 
  
  config.vm.define "acm" do |build|
	build.vm.box = "gusztavvargadr/docker-linux"
    build.vm.hostname = "acm"
	build.vm.network "private_network", ip: "172.16.2.3", virtualbox__intnet: true

	build.vm.provider "virtualbox" do |vb|
		vb.name = "acm_v3"
		vb.cpus = "1"
		vb.memory = "1024"
		vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
		vb.customize ["modifyvm"     , :id, "--vram","64"]
		vb.customize ["modifyvm"     , :id, "--graphicscontroller","vmsvga"]
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end

	build.vm.provision "shell", path: "provision/acm-setup.sh"
  end

end
