# DOCKER-VERSION 0.7.0
FROM stackbrew/ubuntu:12.04
 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y -q openjdk-7-jre-headless wget
RUN wget -q -O /opt/zookeeper-3.4.5.tar.gz http://mirror.olnevhost.net/pub/apache/zookeeper/zookeeper-3.4.5/zookeeper-3.4.5.tar.gz
RUN tar -xzf /opt/zookeeper-3.4.5.tar.gz -C /opt
RUN cp /opt/zookeeper-3.4.5/conf/zoo_sample.cfg /opt/zookeeper-3.4.5/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2888 3888

ENTRYPOINT ["/opt/zookeeper-3.4.5/bin/zkServer.sh"]
CMD ["start-foreground"]
