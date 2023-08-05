# Este repositório tem comandos referente a kubernetes

## Requisitos

| kubectl | eksctl | aws cli |
|---------|--------|---------|

## Para instalar o eksctl acesse o link:


```bash
https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html
```


## Para instalar o kubectl acesse o link:


```bash
https://kubernetes.io/docs/tasks/tools/
```


# Criar Cluster EKS
```bash
eksctl create cluster --name duarte --version 1.27 --region us-east-1 --nodegroup-name workers --node-type t3a.medium --nodes 2 --nodes-min 1 --nodes-max 2 --managed
```

## Habilita conexao no Cluster

```bash
aws eks --region us-east-1 update-kubeconfig --name duarte
export KUBECONFIG=config
```

## Checando o cluster

```bash
kubectl get nodes
```

## Cria o servico
```bash
kubectl apply -f ./nginx-svc.yaml
```


## Verifica o status do servico
```bash
kubectl get service
```

## Cria o Deployment
```bash
kubectl apply -f ./nginx-deployment.yaml
```

## Verifica o status do Deployment
```bash
kubectl get deployment

```
## Verifica o status dos nodes
```bash
kubectl get node
```

## Verifica o status dos pods
```bash
kubectl get pods
```

## Terminou o teste ? Bora derrubar tudo!
```bash
eksctl delete cluster meu-cluster
```
