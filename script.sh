export MINIKUBE_HOME=~/goinfre && minikube start

chmod +x configmapscript.sh
./configmapscript.sh

eval $(minikube -p minikube docker-env)

chmod +x images_files/create_images.sh
cd images_files && ./create_images.sh

cd .. && kubectl apply -f config_files
