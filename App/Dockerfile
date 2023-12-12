FROM nginx:alpine

ARG APP_NAME
ARG OS_VERSION
ARG POD_ID

ENV APP_NAME =  $APP_NAME
ENV OS_VERSION =  $OS_VERSION
ENV POD_ID =  $POD_ID

ADD /srcs/index.html		/usr/share/nginx/html/index.html
ADD /srcs/isalivenginx.sh     /live/isalivenginx.sh