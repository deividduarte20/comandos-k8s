# Requisitos

| kubectl | eksctl |
|---------|--------|

## Criar Cluster EKS
`eksctl create cluster --name duarte --version 1.23 --region us-east-1 --nodegroup-name workers --node-type t3.medium --nodes 2 --nodes-min 1 --nodes-max 3 --managed`

## Habilita conexao no Cluster
`aws eks --region us-east-1 update-kubeconfig --name duarte` <br/><br/>
`export KUBECONFIG=config`

## Checando o cluster
`kubectl get nodes`

## Terminou o teste ? Bora derrubar tudo!
`eksctl delete cluster meu-cluster`
