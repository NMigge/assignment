# Start minikube
minikube start --vm-driver=virtualbox

# Set docker env
eval $(minikube docker-env)

# Build image
git clone https://github.com/karthequian/docker-helloworld
cd docker-helloworld
docker build -t docker-helloworld/hello-world:latest .

# Deployment and service
cd .. 
kubectl apply -f deployment.yaml

# Launch service
minikube service assignment-service

# Print url of the service
echo "This is the url for the service"
echo $(minikube service assignment-service --url)
