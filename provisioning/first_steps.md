ansible all -m ping -i inventory --private-key=./../scripts/sshkey/id_rsa -vvvv -u vagrant

ansible-playbook playbook.yml -i inventory --private-key=./../scripts/sshkey/id_rsa -vvvv -u vagrant -s