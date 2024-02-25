#!/bin/sh

VALUES="values.yaml"

kubectl get ingress argocd-server --namespace argocd \
    || VALUES="values-seed.yaml"

helm template \
    --dependency-update \
    --include-crds \
    --namespace argocd \
    --values "${VALUES}" \
    argocd . \
    | kubectl apply -n argocd -f -

# kubectl -n argocd wait --timeout=60s --for condition=Established \
#        crd/applications.argoproj.io \
#        crd/applicationsets.argoproj.io

for i in {1..5}; do
    kubectl -n argocd wait --timeout=60s --for condition=Established \
    crd/applications.argoproj.io \
    crd/applicationsets.argoproj.io && break || echo "Retry $i/5 failed, retrying..."
    sleep 5
done
