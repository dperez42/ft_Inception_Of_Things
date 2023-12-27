HOW UPLOAD TO DOCKERHUB

1.- Build your image:

docker build -t simple-nginx . 

2.- Login in dockerhb:

(base) Air-de-Daniel:App daniel$ docker login 
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: danipe1970
Password: 
Login Succeeded

3.- Put a Tag in your image with your docker user

docker tag simple-nginx danipe1970/app1:v1

4.- Push your image to docker hub

docker push danipe1970/app1:v1


docker build -t simple-nginx . 
docker run -ti -p 8081:80 alpine_image
docker run -ti -e "APP_NAME=app1" -p 8080:80 simple-nginx
printenv | less
echo $USER