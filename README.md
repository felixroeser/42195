WIP

Run http://mesos.apache.org/ along with https://github.com/mesosphere/marathon provisioned by http://www.ansibleworks.com/

## Vagrant setup

* Instances are hardcoded - dynamic configuration coming soonish

````
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hosts
vagrant plugin install landrush
vagrant up
````

## Ansible powered provisioning

Install Ansible

http://docs.ansible.com/intro_installation.html

````
$ sudo add-apt-repository ppa:rquillo/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
````

* Ips are currently hardcoded

### Seed infrastructure tier 0 - docker registry and zookeeper

````
cd provisioning
ansible-playbook playbook.yml -i inventory --private-key=./../scripts/sshkey/id_rsa -vvvv -u root -s -l it0
````

### Seed infrastructure tier 1 - mesos and marathon

````
ansible-playbook playbook.yml -i inventory --private-key=./../scripts/sshkey/id_rsa -vvvv -u root -s -l it1
````

### Seed infrastructure tier 2 - (director)hitchcock

### Seed infrastructure tier 3 - storage and support

### Seed application tier 1 - mesos slave

````
ansible-playbook playbook.yml -i inventory --private-key=./../scripts/sshkey/id_rsa -vvvv -u root -s -l app
````

## Examples

````
vagrant ssh it0-0
http POST http://localhost:8080/v1/apps/start \
            id=sinatra instances=1 mem=256 cpus=1 \
            executor=/var/lib/mesos/executors/docker \
            cmd='42195/sinatra-example'
curl http://localhost:8080/v1/endpoints
````


## GEM

````
./bin/42195 update --realm example.com --environment dev1
````