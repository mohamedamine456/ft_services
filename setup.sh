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

sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./config_files/config.yaml
sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./images_files/nginx_image/nginx.conf
sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./images_files/mysql_image/wordpress.sql
sed -i '' "s/MINIKUBEIP/$(minikube ip)/g" ./images_files/ftps_image/vsftpd.conf


# SETUP METALLB (LOADBALANCER)

# apply namespace and  deployment of metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only (metellb secret)
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

eval $(minikube -p minikube docker-env)

docker build -t image-ftps images_files/ftps_image/ --no-cache;
docker build -t image-grafana images_files/grafana_image/  --no-cache;
docker build -t image-influxdb images_files/influxdb_image/  --no-cache;
#docker build -t image-mysql images_files/mysql_image/  --no-cache;
docker build -t image-nginx images_files/nginx_image/  --no-cache;
docker build -t image-phpmyadmin images_files/phpmyadmin_image/  --no-cache;
docker build -t image-wordpress images_files/wordpress_image/ --no-cache;

kubectl create -f config_files/config.yaml
#kubectl create -f config_files/mysql_deployment.yaml
kubectl create -f config_files/nginx_deployment.yaml
kubectl create -f config_files/influxdb_deployment.yaml
kubectl create -f config_files/grafana_deployment.yaml
kubectl create -f config_files/phpmyadmin_deployment.yaml
kubectl create -f config_files/wordpress_deployment.yaml
kubectl create -f config_files/ftps_deployment.yaml

sleep 10

kubectl get pods
kubectl get services

sleep 5

minikube dashboard
