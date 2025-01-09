## List of aliases

### Aliases

alias para o editor
```sh
editor
```

alias para o pacote que executará os comandos
```sh
runner
```

Abrir a configuração do terminal
```sh
zconf
```
Ler a configuração do terminal
```sh
zsource
```

Expõe qual é a atual tag git que o repositório possui
```sh
getTag
```

Alias para rodar o comando que executará o script 'dev'
```sh
dev
```

Inicia os containers configurados no docker-compose.yml
```sh
dcupd
```

Pausa os containers configurados no docker-compose.yml
```sh
dcdwn
```

Pausa os containers removendo os volumes, e os reinicia
```sh
recon
```

Expõe o arquivo que contém todos os aliases
```sh
allias
```

Executa o comando que executará o script 'db:prepare'
```sh
prepare
```

Executa o comando que criará uma nova migration "knex migrate:make"
```sh
criaMigration <nome_da_migração>
```

Executa o rollback da migration "knex migrate:rollback"
```sh
rollback
```

Executa a migração do banco de dados "knex migrate:latest"
```sh
latest
```
Executa o comando que executará o script 'test:unit --watch'
```sh
wtest
```
Executa o comando 'gitmoji -c'
```sh
gim
```

### Git
Executa 'git merge origin/master'
```sh
gmm
```

Executa 'git merge origin/develop'
```sh
gmd
```
Executa 'git add .'
```sh
gaa
```


Executa o comando 'runner generate'
```sh

generate
```

Adiciona um novo minor
```sh
minorion
```

Adiciona um novo patch
```sh
patichon
```

Adiciona uma nova versão, esperando o tipo da versão ('major', 'minor', 'patch')
```sh
addTag
```