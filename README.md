## Commands

ansible-playbook playbook.yml -i inventory --private-key=./../scripts/sshkey/id_rsa -vvvv -u vagrant -s

## JDK

export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server
