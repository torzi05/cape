Vagrant.configure("2") do |config|
	config.vm.provider "virtualbox" 
	config.vm.define "workstation" do |workstation|
		workstation.vm.box = "centos/8"
		workstation.vm.hostname = "workstation.lab.example.com"
		workstation.vm.network "private_network" , ip: "172.25.250.9"
	end
	config.vm.define "servera" do |servera|
		servera.vm.box = "centos/8"
		servera.vm.hostname = "servera.lab.example.com"
		servera.vm.network "private_network" , ip: "172.25.250.10"
	end
	config.vm.define "serverb" do |serverb|
		serverb.vm.box = "centos/8"
		serverb.vm.hostname = "serverb.lab.example.com"
		serverb.vm.network "private_network" , ip: "172.25.250.11"
	end
	config.vm.define "serverc" do |serverc|
		serverc.vm.box = "centos/8"
		serverc.vm.hostname = "serverc.lab.example.com"
		serverc.vm.network "private_network" , ip: "172.25.250.12"
	end
	config.vm.define "serverd" do |serverd|
		serverd.vm.box = "centos/8"
		serverd.vm.hostname = "serverd.lab.example.com"
		serverd.vm.network "private_network" , ip: "172.25.250.13"
	end
	config.vm.define "classroom" do |classroom|
		classroom.vm.box = "centos/8"
		classroom.vm.hostname = "classroom.example.com"
		classroom.vm.network "private_network" , ip: "172.25.250.254"
	end
	config.vm.provision :ansible do |ansible|
 	ansible.playbook = "playbook.yml"
end
end
