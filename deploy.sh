docker build -t jordan396/multi-client -f ./client/Dockerfile ./client
docker build -t jordan396/multi-server -f ./server/Dockerfile ./server
docker build -t jordan396/multi-worker -f ./worker/Dockerfile ./worker
docker push jordan396/multi-client
docker push jordan396/multi-server
docker push jordan396/multi-worker
kubectl rollout restart -f k8s-config