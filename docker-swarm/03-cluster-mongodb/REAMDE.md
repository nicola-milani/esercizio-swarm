Questo progetto realizza:
 - un cluster swarm
 - un cluster mongodb

## Definizione cluster swarm con accesso remoto
```
vagrant up --provider parallels --no-parallel
```
## Definizione contesto
NB: aggiungere in /etc/hosts i riferimenti al nodo manager da usare
```
docker context update swarm01 --description "esempio di cluster swarm 3" --docker "host=tcp://manager01:2375"
```

vagrant ssh -c "hostname -I | cut -d' ' -f2" manager01

docker stack ps portainer

docker stack ps --no-trunc portainer

## Avvio ReplicaSet mongodb
### Definizione dei secret per mongo
echo "usermongo" | docker secret create MONGODB_USERNAME -
echo "password_super_complex" | docker secret create MONGODB_PASSWORD -
echo "example123456" | docker secret create MONGO_DB_KEYFILE -
### Definizione delle label sui nodi
docker node update --label-add web=true manager01
docker node update --label-add mongo3=true worker03
docker node update --label-add mongo2=true worker02
docker node update --label-add mongo1=true worker01

docker node ls --filter node.label=web
docker node ls --filter node.label=mongo1
docker node ls --filter node.label=mongo2
docker node ls --filter node.label=mongo3

### Avvio delle istanze mongodb
cd databases/mongodb/cluster2
docker stack deploy --compose-file=docker-stack.yml mongo

