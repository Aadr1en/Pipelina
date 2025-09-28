#!/usr/bin/env bash
set -e
IMAGE=adren493/simple-app:local   

# 1) Build image
docker build -t $IMAGE app/

# 2) Create kind cluster 
kind create cluster --name simple-dev || true

# 3) Charger l'image dans kind
kind load docker-image $IMAGE --name simple-dev

# 4) Appliquer manifests
kubectl apply -f k8s/service.yaml
cat k8s/deployment.yaml | sed "s|{{ IMAGE }}|$IMAGE|g" | kubectl apply -f -

# 5) Accès
echo "Accéder à l'app via: http://localhost:30080 (si NodePort = 30080 dans service.yaml)"
