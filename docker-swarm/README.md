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

## Installiamo portainer

```
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
```


