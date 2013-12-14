# -*- mode: ruby -*-
# vi: set ft=ruby :

def ssh_provisioning(config)
  config.vm.provision :shell do |s|
    s.path = "scripts/populate_sshkey.sh"
    s.args = "/root root"
  end
end

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "42195"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"

  # config.vbguest.auto_update = true

  # NOT YET
  # config.landrush.enable

  config.vm.define 'it0-0' do |cfg|
    cfg.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024, "--cpus", 1 ]
    end
    cfg.vm.network :private_network, ip: "10.1.10.10"
    cfg.vm.hostname = 'it0-0'
    cfg.vm.provision :hosts
    ssh_provisioning(cfg)
  end

  config.vm.define 'app-0' do |cfg|
    cfg.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024, "--cpus", 1 ]
    end
    cfg.vm.network :private_network, ip: "10.1.11.10"
    cfg.vm.hostname = 'app-0'
    cfg.vm.provision :hosts
    ssh_provisioning(cfg)
  end

  # config.ssh.forward_agent = true
  # config.vm.synced_folder "../data", "/vagrant_data"
end
