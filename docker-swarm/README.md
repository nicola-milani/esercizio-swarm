Questo esercizio definisce un cluster swarm tramite vagrant
- 2 nodi worker
- 2 nodi manager

Azioni:
Verifichiamo lo stato del quorum manager con docker info
Proviamo a spegnere un nodo

Aggiungiamo un nodo manager
Verifichiamo lo stato del quorum manager con docker info
Proviamo a spegnere un nodo
Proviamo a spegnere un nuovo nodo
Quali sono i quorum possibili per una elezione del leader?

- Installiamo portainer

docker context create swarmtls --description "esempio contesto tls" --docker "host=tcp://manager01:2376,ca=$(pwd)/ca.pem,cert=$(pwd)/cert.pem,key=$(pwd)/key.pem"
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
docker node ps $(docker node ls -q) 

docker service create \
  --name my-web \
  --publish published=8086,target=80 \
  --mode global \
  nginx

netstat -lntp | grep dockerd