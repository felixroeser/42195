http://docs.docker.io/en/latest/use/workingwithrepository/

Build some containers:

sudo docker build .
sudo docker tag $IMAGE_ID 42195/zookeeper
sudo docker run -p 28118 42195/zookeeper