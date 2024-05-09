#!/bin/bash

# Lista de deployments para excluir
declare -a deployments_to_exclude=("ms-teste-fora" "ms-teste-fora2" "default" "kube-system" "coredns" "local-path-provisioner")

# Formata a lista de deployments para o formato JSON
exclude=$(printf '%s\n' "${deployments_to_exclude[@]}" | jq -R . | jq -s .)

# Itera sobre os namespaces
for namespace in $(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}'); do
    # Itera sobre os deployments do namespace
    for deployment in $(kubectl get deployments -n "$namespace" -o json | jq -r --argjson exclude "$exclude" '.items[] | select(.kind == "Deployment" and (.metadata.name | IN($exclude[])) | not) | .metadata.name'); do
        # Escala para 0 réplicas
        kubectl scale --namespace="$namespace" --replicas=0 deployment/"$deployment"
    done
done