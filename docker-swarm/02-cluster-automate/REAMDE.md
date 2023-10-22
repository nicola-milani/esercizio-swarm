# Descrizione
Realizzazione di uno swarm docker vuoto
## Avvio di portainer
```
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
```

## Crezione contesto tls

```
docker context create swarmtls --description "esempio contesto tls" --docker "host=tcp://manager01:2376,ca=$(pwd)/ca.pem,cert=$(pwd)/cert.pem,key=$(pwd)/key.pem"
```

## Cosa succede sul cluster

```
docker node ps $(docker node ls -q) 
```

## Esempio creazione service
```
docker service create \
  --name my-web \
  --publish published=8086,target=80 \
  --mode global \
  nginx
```


## Vedere porte aperte su host 
```
netstat -lntp | grep dockerd
```

ip_addr=$(hostname -I | awk '{print $2}')
docker swarm init --listen-addr ${ip_addr}:2377 --advertise-addr ${ip_addr}:2377

oppure 
docker swarm init --listen-addr 172.10.10.2:2377 --advertise-addr 172.10.10.2:2377

