

#List images
docker images
#List containers
docker ps -a

#Remove container
docker container rm 213b17d7c2e1
#Remove image
docker image rm a1db17d7c2d2


#Build docker from Dockerfile
sudo docker build -t docker-crosstool .

#Run a new container instance of the created image
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/kali/toolchain/:/mnt/ --entrypoint bash docker-crosstool


