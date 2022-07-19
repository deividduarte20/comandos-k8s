## Este repositório tem comandos referente a kubernetes

# Requisitos

| kubectl | eksctl |
|---------|--------|

# Criar Cluster EKS
eksctl create cluster --name duarte --version 1.22 --region us-east-1 --nodegroup-name workers --node-type t2.micro --nodes 2 --nodes-min 1 --nodes-max 3 --managed

## Habilita conexao no Cluster
aws eks --region us-east-1 update-kubeconfig --name meu-cluster
export KUBECONFIG=config

## Checando o cluster
kubectl get nodes

## Cria o servico
kubectl apply -f ./nginx-svc.yaml

## Verifica o status do servico
kubectl get service

## Cria o Deployment
kubectl apply -f ./nginx-deployment.yaml

## Verifica o status do Deployment
kubectl get deployment

## Verifica o status dos nodes
kubectl get node

## Verifica o status dos pods
kubectl get pods

## Terminou o teste ? Bora derrubar tudo!
eksctl delete cluster meu-cluster
