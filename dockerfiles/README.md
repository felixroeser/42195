http://docs.docker.io/en/latest/use/workingwithrepository/

Build some containers:

sudo docker build .
sudo docker tag $IMAGE_ID 42195/zookeeper
sudo docker tag $IMAGE_ID 42195/mesos

Run some containers:

sudo docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888  42195/zookeeper
