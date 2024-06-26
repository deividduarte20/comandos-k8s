## Autor: Deivid Duarte
## Lista de comandos usados no kubernetes

# Informações do cluster
kubectl cluster-info

# Imprimir informações de api suportadas no cluster 
kubectl api-resources

# Consultar todos os pods e namespaces
kubectl get all --all-namespaces

# Listar apenas nomes dos pods e redirecionando para arquivo
kubectl get pods -o name > /tmp/pods

# Criar namespace
kubectl create namespace nome_namespace

# Consultar pods em um namespace
kubectl get pods -n nome_namespace

# Consultar pods por node
kubectl get pods -o wide --field-selector spec.nodeName=nome-node

# Consultar labels dos nodes
kubectl get nodes --show-labels

# Adicionar label em node
kubectl label nodes nome-node env=dev

# Remover label em node
kubectl label nodes nome-node env-

# Mudar de contexto (Entrar em uma namespace)
kubectl config set-context --current --namespace=nome_namespace

# Consultar pods filtrando label e removendo cabeçalho
kubectl get pods --selector env=dev --no-headers | wc -l

# Consultar pods filtrando por várias labels
kubectl get pods --selector env=dev,bu=finance,tier=frontend

# Subir pod manualmente
kubectl run nome_aplicacao_sua_escolha --image=nginx

# Subir pod em um namespace
kubectl run nome_aplicacao_sua_escolha --namespace=nome_nasmespace --image=nginx 

# Subir pod e com acesso ao pod com shell bash
kubectl run -ti nome_pod --image=debian bash 

# Deletar pod
kubectl delete pod nome_pod

# Consultar detalhes de pod
kubectl describe pod nome_pod

# Consultar detalhes de pod em um namespace
kubectl describe pod app-girlene -n namespace

# Criar configmap
kubectl create cm simple-cm --from-literal=Code=teste --dry-run=client -o yaml > simple-cm.yaml

# Criar configmap com arquivo contendo envs chave/valor (my-app.txt)
kubectl create cm my-cm --from-file=my-app-file.txt --from-literal=my-description=testingconfigmap/my-cn

# Criar service ClusterIP
kubectl expose pod nginx --name=sv2 --type=ClusterIP --port=80 --target-port=80 --dry-run=client -o yaml

# Consultar labels de deployment
kubectl get deploy nome_deploy --show-labels

# Consultar replicaset com determinada label
kubectl get rs -l label

# Cria pod executando comando
kubectl run nome_pod --image busybox -- sleep 3600

# Deleta todos os pods do namespace default
kubectl delete --all pod -n default

# Deleção de DaemonSet com opção de deixar pods orfãos
kubectl delete daemonset nome-daemonset --cascade=orphan

# Consultar namespaces
kubectl get nasmespace

# Deletar namespace
kubectl delete namespace duarte

# Consultar log de pod
kubectl logs -f nome_pod

# Criar deploy com 2 replicas
kubectl create deploy nome_app --image=nginx --replicas=2

# Consultar deploy
kubectl get deploy

# Alterar imagem do deploy em execução (Obs: o --record está depreciado então pode executar sem o mesmo)
kubectl set image deploy nome-deploy nome-container=novo-nome-image-docker --record

# Deletar deploy
kubectl delete deploy nome_deploy

# Aumentar ou diminuir o número de replicas de deploy
kubectl scale deploy nome_deploy --replicas=4

# Editar deploy
kubectl edit deploy nome_deploy

# Restartar deploy
kubectl rollout restart deploy nome-deploy

# Consultar status do deploy
kubectl rollout status nome_deployment

# Consultar histórico de rollout
kubectl rollout history deployment/nome_deploy

# Consultar conteúdo da revisão
kubectl rollout history deploy/nome-deploy --revision=numero

# Efetuar rollout para versão anterior
Kubectl rollout undo deployment nome_deploy

# Efetuar rollout de deployment para versão especifica de revisão
Kubectl rollout undo deployment nome_deploy --to-revision=numero

# Efetuar rollout de deployment sem necessidade de colocar revisão no comando
Kubectl rollout undo deployment nome_deploy

# Pausa deploy
kubectl rollout pause deploy/nome_deployment

# Resume o deploy pausado anteriormente
kubectl rollout resume deploy/nome_deployment

# Criar manifesto de pod
kubectl run nome_app --image=nginx --port=80 --dry-run=client -o yaml > simples.pod.yaml

# Consultar em qual node o pod está rodando
kubectl get pods nome_pod -o wide

# Consultar detalhes do deploy
kubectl get deployment nome_deploy -o yaml

# Criar simulação de deploy no formato yaml
kubectl create deploy app-duarte-deploy --image=nginx --port=80 --replicas=2 --dry-run=client -o yaml

# Obter informações do service
kubectl get services ou kubectl get svc

# expor porta pelo clusterIP (Comunicação interna)
kubectl expose pod nome_pod --port=80

# Encaminhar porta para porta local do pod
kubectl port-forward deploy/nome_deploy porta_servico:porta_padrao_pod

# Editar service
kubectl edit services nome_service

# Acessar container
kubectl exec -ti nome_container -- bash ou kubectl exec -ti nome_container -- sh

# Executar comando em container por exemplo ver variaveis 
kubectl exec -ti nome_container -- env

# Testar conexão através do curl (o zero indica localhost)
curl -v telnet://0:6379

# Atualizar imagem (Comando --record está depreciado)
kubectl set image deploy nome_deploy nginx=nginx:1.14.2 --record

# Consulta consumo de CPU/memória de pods
kubectl top pods

# Consulta consumo de CPU/memória de nodes
kubectl top nodes

# Criar secret
kubectl create secret generic nome_secret --from-literal=user=deivid --from-literal=pass=123

# Editar secret criada
kubectl edit secret nome_secret

# Consultar secrets
kubectl get secrets

# Copiar arquivo para dentro de pod
kubectl cp ./nome_arquivo nome_pod:/tmp/

# Consulta em qual load balancer seu microserviço está alocado
kubectl get ingress

# Cria variavel de ambiente em um pod
# kubectl run nome_pod --image nginx --port 80 --env=tier=web --env environment=dev

# Criar label no namespace:
kubectl label namespace ms-app key=valor

# Consultar label de namespace
kubectl get ns ms-sre-app-pj -o jsonpath='{.metadata.labels}' | grep team

# Suspender/desativar execução de cronjob
kubectl patch cronjob nome_cronjob -p '{"spec":{"suspend":true}}'

# Reativar execução de cronjob
kubectl patch cronjob nome_cronjob -p '{"spec":{"suspend":false}}'

# Alterar policy de PV
kubectl patch pv nome-pv -p '{"spec": {"persistentVolumeReclaimPolicy":"Retain"}}'

# Deletar todos os persistent volumes claim
kubectl delete pvc --all

# RBAC - Gerar chave privada em um arquivo (auditor.key)
openssl genrsa -out auditor.key 2048

# Cria um arquivo de solicitação de assinatura de certificado (CSR - Certificate Signing Request)
openssl req -new -key auditor.key -out auditor.csr -subj "/CN=auditor/O=My-Company"

# Consulta se temos permissão para executar get pods
kubectl auth can-i get pods

# Consulta se a permissão é global
kubectl auth can-i '*' '*' --all-namespaces