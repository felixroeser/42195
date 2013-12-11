# DOCKER-VERSION 0.7.0
FROM stackbrew/ubuntu:12.04

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y -q openjdk-7-jre-headless curl 
 
# download and install mesos
RUN curl http://downloads.mesosphere.io/master/ubuntu/12.04/mesos_0.14.2_amd64.deb > mesos.deb && dpkg --install mesos.deb && rm mesos.deb

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV LD_LIBRARY_PATH %JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server

EXPOSE 5050

ENTRYPOINT ["/usr/local/sbin/mesos-master"]
CMD ["--zk=zk://192.168.1.148:2181--port=5050 --log_dir=/var/log/mesos --ip=$IP"]
