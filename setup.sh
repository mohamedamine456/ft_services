#! /bin/bash

MINIKUBE_STATUS=$(minikube status | head -n 1)

if [ MINIKUBE_STATUS != "minikube" ]
then
	export MINIKUBE_HOME=~/goinfre && minikube start --driver=virtualbox
fi

kubectl delete services --all
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete secrets --all
kubectl delete pv --all

sleep 15

#replace MINIKUBE IP WITH VALUES IN FILES

sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./srcs/config_files/config.yaml
sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./srcs/images_files/nginx_image/nginx.conf
sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./srcs/images_files/mysql_image/wordpress.sql
sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./srcs/images_files/ftps_image/vsftpd.conf


# SETUP METALLB (LOADBALANCER)

minikube addons enable metallb

eval $(minikube -p minikube docker-env)

docker build -t image-ftps srcs/images_files/ftps_image/ --no-cache;
docker build -t image-grafana srcs/images_files/grafana_image/  --no-cache;
docker build -t image-influxdb srcs/images_files/influxdb_image/  --no-cache;
docker build -t image-mysql srcs/images_files/mysql_image/  --no-cache;
docker build -t image-nginx srcs/images_files/nginx_image/  --no-cache;
docker build -t image-phpmyadmin srcs/images_files/phpmyadmin_image/  --no-cache;
docker build -t image-wordpress srcs/images_files/wordpress_image/ --no-cache;

kubectl apply -f srcs/config_files/config.yaml
kubectl create -f srcs/config_files/mysql_deployment.yaml
kubectl create -f srcs/config_files/nginx_deployment.yaml
kubectl create -f srcs/config_files/influxdb_deployment.yaml
kubectl create -f srcs/config_files/grafana_deployment.yaml
kubectl create -f srcs/config_files/phpmyadmin_deployment.yaml
kubectl create -f srcs/config_files/wordpress_deployment.yaml
kubectl create -f srcs/config_files/ftps_deployment.yaml

sleep 10

kubectl get pods
kubectl get services

sleep 5

minikube dashboard
