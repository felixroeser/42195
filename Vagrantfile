# -*- mode: ruby -*-
# vi: set ft=ruby :

cluster_config = {
  zookeepers: {
    memory: 1024,
    nr: 1,
    base_ip: '10.1.1'
  },
  docker: {
    memory: 256,
    nr: 1,
    cpus: 1,
    base_ip: '10.1.5'
  },
  director: {
    memory: 256,
    nr: 1,
    cpus: 1,
    base_ip: '10.1.4'
  },  
  vorarbeiter: {
    memory: 1024,
    nr: 1,
    base_ip: '10.1.2'
  },
  maloche: {
    memory: 512,
    nr: 3,
    cpus: 2,
    base_ip: '10.1.3'
  }
}

env = 'dev'
cluster_name = 'cluster1'

## vagrant plugins required:
# vagrant-omnibus, vagrant-hosts => vagrant plugin install vagrant-cachier
Vagrant.configure("2") do |config|

  config.vm.box = "42195"
  # See http://blog.phusion.nl/2013/11/08/docker-friendly-vagrant-boxes/
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"

  # for vagrant-cachier
  config.cache.auto_detect = true

  config.vm.synced_folder ".", "/vagrant", nfs: true

  config.landrush.enable
  config.landrush.host "director.#{cluster_name}.#{env}", '10.1.4.10'

  cluster_config.each do |node_type, node_config|

    node_config[:nr].times do |node_nr|

      hostname = "#{node_type}-#{node_nr}.#{cluster_name}.#{env}"
      ip = "#{node_config[:base_ip]}.#{10+node_nr}"

      config.vm.define hostname do |cfg|
        cfg.vm.hostname = hostname
        cfg.vm.network :private_network, ip: ip
        cfg.vm.provision :hosts

        cfg.vm.provider :virtualbox do |vb|
          vb.name = '42195-' + hostname
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

