export MINIKUBE_HOME=~/goinfre && minikube start

chmod +x configmapscript.sh
./configmapscript.sh

eval $(minikube -p minikube docker-env)

chmod +x images_files/create_images.sh
./images_files/create_images.sh

kubectl apply -f config_files
