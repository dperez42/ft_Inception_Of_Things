docker build -t simple-nginx . 
docker run -ti -p 8081:80 alpine_image
docker run -ti -e "APP_NAME=app1" -p 8080:80 simple-nginx


(base) Air-de-Daniel:App daniel$ docker login 
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: danipe1970
Password: 
Login Succeeded

docker tag simple-nginx danipe1970/app1:v1

docker push danipe1970/app1:v1

printenv | less
echo $USER