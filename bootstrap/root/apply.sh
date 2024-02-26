#!/bin/sh

VALUES="values.yaml"

kubectl get ingress gitea --namespace gitea \
    || VALUES="values-seed.yaml"

echo "GITEA VALUES = $VALUES"

sleep 30

helm template \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    argocd . \
    | kubectl apply -n argocd -f -
