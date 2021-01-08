sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./config_files/config.yaml
sed -i '' "s/$(minikube ip)/MINIKUBEIP/g" ./images_files/nginx_image/nginx.conf

minikube delete
sleep 20 
rm -rf /Users/mlachheb/goinfre/.minikube 
rm -rf ~/.minikube
