## CHANGE INDEX.HTML

## HOW UPLOAD TO DOCKERHUB

1.- Build your image:

docker build -t my_app . 

2.- Login in dockerhub:

docker login 

Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.

Username: danipe1970

Password: 

Login Succeeded

3.- Put a Tag in your image with your docker user

docker tag my_app danipe1970/app1:v1

4.- Push your image to docker hub

docker push danipe1970/app1:v1


docker build -t my_app . 
docker run -ti -p 8081:80 alpine_image
docker run -ti -e "APP_NAME=app1" -p 8080:80 simple-nginx

docker run -ti -e "MESSAGE=app1" -p 8080:80 danipe1970/app1:v1
printenv | less
echo $USER

   background: radial-gradient(879px at 10.4% 22.3%, rgb(255, 235, 238) 0%, #D4061A 93.6%);
  #background: radial-gradient(879px at 10.4% 22.3%, rgb(255, 235, 238) 0%, #D48406 93.6%);
  #background: radial-gradient(879px at 10.4% 22.3%, rgb(255, 235, 238) 0%, #04A00F 93.6%);