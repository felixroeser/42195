WIP

Run http://mesos.apache.org/ along with https://github.com/mesosphere/marathon provisioned by http://www.ansibleworks.com/

## Vagrant setup

* Instances are hardcoded - dynamic configuration coming soonish

````
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hosts
# vagrant plugin install landrush
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

### Bootstrap provisioning

```
# Use ssh-agent:
ssh-agent
ssh-add ~/.ssh/keys/42195/id_rsa

42195 init
42195 update --realm example.com --environment dev1

# Startup and provision manually for now:
cd state/example.com/dev1
vagrant up
cd provisioning
ansible-playbook playbook.yml -i ../inventory -vvvv -u root -s -l it
ansible-playbook playbook.yml -i ../inventory -vvvv -u root -s -l app

```


## Examples

````
# Build a sample sinatra docker image and push to the registry
vagrant ssh it-0
mkdir builds
cd builds
git clone https://github.com/felixroeser/mesos-example-sinatra.git
cd mesos-example-sinatra
sudo docker build -t mesos-example-sinatra .
sudo docker tag $0 localhost:5000/mesos-example-sinatra:0.1.0
sudo docker push localhost:5000/mesos-example-sinatra:0.1.0

http POST http://localhost:8080/v1/apps/start \
            id=mesos-example-sinatra instances=1 mem=256 cpus=1 \
            executor=/var/lib/mesos/executors/docker \
            cmd='mesos-example-sinate:0.1.0'
curl http://localhost:8080/v1/endpoints
````


## GEM

````
./bin/42195 update --realm example.com --environment dev1
````