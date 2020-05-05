docker build -t Jordan396/multi-client -f ./client/Dockerfile ./client
docker build -t Jordan396/multi-server -f ./server/Dockerfile ./server
docker build -t Jordan396/multi-worker -f ./worker/Dockerfile ./worker
docker push Jordan396/multi-client
docker push Jordan396/multi-server
docker push Jordan396/multi-worker
kubectl rollout restart -f k8s-config