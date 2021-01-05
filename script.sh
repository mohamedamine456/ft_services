MINIKUBE_STATUS=$(minikube status | head -n 1)

if [ MINIKUBE_STATUS != "minikube" ]
then
	export MINIKUBE_HOME=~/goinfre && minikube start
fi

kubectl delete services --all
kubectl delete deployments --all
kubectl delete pods --all
kubectl delete secrets --all
kubectl delete pv --all
kubectl delete pvc -all

sh configmapscript.sh

eval $(minikube -p minikube docker-env)

cd images_files && sh create_images.sh

cd .. && kubectl apply -f config_files

minikube dashboard
