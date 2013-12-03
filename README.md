WIP

Run http://mesos.apache.org/ along with https://github.com/mesosphere/marathon provisioned by http://www.ansibleworks.com/

## Vagrant setup

````
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-hosts
vagrant plugin install landrush
vagrant up
````

## Ansible powered provisioning

TBA

## First steps

````
# Forward mesos ui
vagrant ssh masters-0 -- -L 5050:10.1.2.10:5050
# Forward marathon ui
vagrant ssh masters-0 -- -L 8080:10.1.2.10:8080
````

### Test jobs

````
gem install marathon_client

# https download fails => use heel and ngrok.com
# marathon start -i sinatra -u http://github.com/felixroeser/mesos-example-sinatra/archive/1.0.tar.gz \
#    -C "cd mesos-example-sinatra-1.0 && bundle install && bundle exec rackup" -c 1.0 -m 256


````



