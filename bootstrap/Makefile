.POSIX:

default: namespace argocd root

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -

.PHONY: argocd
argocd:
	helm upgrade --install argocd argocd \
	--namespace argocd \
	--dependency-update

.PHONY: root
root:
	cd root && ./apply.sh
