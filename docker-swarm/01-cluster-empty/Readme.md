# Esercizi

## Esercizio 1
1. collegarsi via ssh tramite vscode (edit di .ssh/config)
2. configurare il demone docker per l'uso del socket tcp (https://docs.docker.com/config/daemon/remote-access/)
```
{
  "hosts": ["unix:///var/run/docker.sock", "tcp://127.0.0.1:2375"]
}
```
3. trovare l'errore nei log
4. risoluzione errore systemd
5. configurare il client docker del proprio pc per collegarsi al contesto remoto

