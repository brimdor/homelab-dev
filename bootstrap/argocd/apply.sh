#!/bin/sh

VALUES="values.yaml"

kubectl get ingress argocd-server --namespace argocd \
    || VALUES="values-seed.yaml"

echo ""
echo "<<<<<< ArgoCD Pods and Services >>>>>>"
kubectl get pods --namespace argocd
kubectl get services --namespace argocd
echo ""
