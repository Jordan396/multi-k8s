docker build -t jordan396/multi-client:latest -t jordan396/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jordan396/multi-server:latest -t jordan396/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jordan396/multi-worker:latest -t jordan396/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jordan396/multi-client:latest
docker push jordan396/multi-server:latest
docker push jordan396/multi-worker:latest

docker push jordan396/multi-client:$SHA
docker push jordan396/multi-server:$SHA
docker push jordan396/multi-worker:$SHA

kubectl apply -f k8s-config
kubectl set image deployments/server-deployment server=jordan396/multi-server:$SHA
kubectl set image deployments/client-deployment client=jordan396/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jordan396/multi-worker:$SHA