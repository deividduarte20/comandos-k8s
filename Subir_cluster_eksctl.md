# Requisitos

| kubectl | eksctl |
|---------|--------|

## Criar Cluster EKS
```bash
eksctl create cluster --name duarte --version 1.27 --region us-east-1 --nodegroup-name workers --node-type t3a.medium --nodes 2 --nodes-min 1 --nodes-max 2 --managed
```

## Habilita conexao no Cluster
```bash
aws eks --region us-east-1 update-kubeconfig --name duarte
```

## Checando o cluster
```bash
kubectl get nodes
```

## Terminou o teste ? Bora derrubar tudo!
```bash
eksctl delete cluster meu-cluster
```
