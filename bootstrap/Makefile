.POSIX:

default: namespace argocd root

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -

.PHONY: argocd
argocd:
	helm template --install argocd argocd \
	--namespace argocd \
	--dependency-update \
	--force \
	--replace \
	| kubectl apply -n argocd -f -
	cd argocd && ./apply.sh

.PHONY: root
root:
	cd root && ./apply.sh
