srva_disk = './tmp/srva.vdi'
srvb_disk = './tmp/srvb.vdi'
srvc_disk = './tmp/srvc.vdi'
srvd_disk = './tmp/srvd.vdi'

Vagrant.configure("2") do |config|

	config.vm.define "workstation" do |workstation|
		workstation.vm.box = "centos/8"
		workstation.vm.hostname = "workstation.lab.example.com"
		workstation.vm.network "private_network" , ip: "172.25.250.9"
	end

	config.vm.define "servera" do |servera|
		servera.vm.box = "centos/8"
		servera.vm.hostname = "servera.lab.example.com"
		servera.vm.network "private_network" , ip: "172.25.250.10"
		servera.vm.network "private_network" , ip: "172.25.250.100"
		servera.vm.provider :virtualbox do |a|
			unless File.exist?(srva_disk)
				a.customize ['createhd', '--filename', srva_disk, '--size', 5 * 1024]
			end
			a.customize ['storageattach', :id, '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', srva_disk]
	end
	end

	config.vm.define "serverb" do |serverb|
		serverb.vm.box = "centos/8"
		serverb.vm.hostname = "serverb.lab.example.com"
		serverb.vm.network "private_network" , ip: "172.25.250.11"
		serverb.vm.network "private_network" , ip: "172.25.250.101"
		serverb.vm.provider :virtualbox do |b|
			unless File.exist?(srvb_disk)
				b.customize ['createhd', '--filename', srvb_disk, '--size', 5 * 1024]
			end
			b.customize ['storageattach', :id, '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', srvb_disk]
	end
	end

	config.vm.define "serverc" do |serverc|
		serverc.vm.box = "centos/8"
		serverc.vm.hostname = "serverc.lab.example.com"
		serverc.vm.network "private_network" , ip: "172.25.250.12"
		serverc.vm.network "private_network" , ip: "172.25.250.102"
		serverc.vm.provider :virtualbox do |c|
			unless File.exist?(srvc_disk)
				c.customize ['createhd', '--filename', srvc_disk, '--size', 5 * 1024]
			end
			c.customize ['storageattach', :id, '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', srvc_disk]
	end
	end

	config.vm.define "serverd" do |serverd|
		serverd.vm.box = "centos/8"
		serverd.vm.hostname = "serverd.lab.example.com"
		serverd.vm.network "private_network" , ip: "172.25.250.13"
		serverd.vm.network "private_network" , ip: "172.25.250.103"
		serverd.vm.provider :virtualbox do |d|
			unless File.exist?(srvd_disk)
				d.customize ['createhd', '--filename', srvd_disk, '--size', 5 * 1024]
			end
			d.customize ['storageattach', :id, '--storagectl', 'IDE', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', srvd_disk]
	end
	end

	config.vm.define "classroom" do |classroom|
		classroom.vm.box = "centos/8"
		classroom.vm.hostname = "classroom.example.com"
		classroom.vm.network "private_network" , ip: "172.25.250.254"
	end

	config.vm.provision :ansible do |ansible|
 	ansible.playbook = "boot.yml"
end
end
