# -*- mode: ruby -*-
# vi: set ft=ruby :

cluster_config = {
  zk: {
    memory: 1024,
    nr: 1,
    base_ip: '10.1.1'
  },
  masters: {
    memory: 1024,
    nr: 1,
    base_ip: '10.1.2'
  },
  slaves: {
    memory: 1024,
    nr: 1,
    cpus: 1,
    base_ip: '10.1.3'
  }
}

## vagrant plugins required:
# vagrant-omnibus, vagrant-hosts => vagrant plugin install vagrant-cachier
Vagrant.configure("2") do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # for vagrant-cachier
  config.cache.auto_detect = true

  config.vm.synced_folder ".", "/vagrant", nfs: true

  cluster_config.each do |node_type, node_config|

    node_config[:nr].times do |node_nr|

      hostname = "#{node_type}-#{node_nr}"
      ip = "#{node_config[:base_ip]}.#{10+node_nr}"

      config.vm.define hostname do |cfg|
        cfg.vm.hostname = hostname
        cfg.vm.network :private_network, ip: ip
        cfg.vm.provision :hosts

        cfg.vm.provider :virtualbox do |vb|
          vb.name = 'mesos-' + hostname
          vb.customize ["modifyvm", :id, "--memory", node_config[:memory], "--cpus", node_config[:cpus] || 1 ]
        end

        cfg.vm.provision :shell do |s|
          s.path = "scripts/populate_sshkey.sh"
          s.args = "/root root"
        end

        cfg.vm.provision :shell do |s|
          s.path = "scripts/populate_sshkey.sh"
          s.args = "/home/vagrant vagrant"
        end

      end

    end

  end

end

