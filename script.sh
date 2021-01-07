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
kubectl delete pvc --all

# SETUP METALLB (LOADBALANCER)

# see what changes would be made, returns nonzero returncode if different
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system
sleep 10
# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system
# apply namespace and  deployment of metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only (metellb secret0
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

eval $(minikube -p minikube docker-env)

docker build -t image-ftps images_files/ftps_image/ --no-cache;
docker build -t image-grafana images_files/grafana_image/  --no-cache;
docker build -t image-influxdb images_files/influxdb_image/  --no-cache;
docker build -t image-mysql images_files/mysql_image/  --no-cache;
docker build -t image-nginx images_files/nginx_image/  --no-cache;
docker build -t image-phpmyadmin images_files/phpmyadmin_image/  --no-cache;
docker build -t image-wordpress images_files/wordpress_image/ --no-cache;

kubectl create -f config_files/config.yaml
kubectl create -f config_files/mysql_deployment.yaml
kubectl create -f config_files/nginx_deployment.yaml
kubectl create -f config_files/influxdb_deployment.yaml
kubectl create -f config_files/grafana_deployment.yaml
kubectl create -f config_files/phpmyadmin_deployment.yaml
kubectl create -f config_files/wordpress_deployment.yaml
kubectl create -f config_files/ftps_deployment.yaml

sleep 10 && minikube dashboard
