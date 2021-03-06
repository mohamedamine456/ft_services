#! /bin/bash

sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./srcs/config_files/config.yaml
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./srcs/images_files/nginx_image/nginx.conf
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./srcs/images_files/mysql_image/wordpress.sql
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./srcs/images_files/ftps_image/vsftpd.conf

minikube delete
sleep 20 
rm -rf /Users/mlachheb/goinfre/.minikube 
rm -rf ~/.minikube
