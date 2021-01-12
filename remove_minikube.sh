#! /bin/bash

sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./config_files/config.yaml
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./images_files/nginx_image/nginx.conf
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./images_files/mysql_image/wordpress.sql
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./images_files/ftps_image/start_ftps.sh

minikube delete
sleep 20 
rm -rf /Users/mlachheb/goinfre/.minikube 
rm -rf ~/.minikube
