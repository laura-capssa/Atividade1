# Documentação de Configuração AWS e Linux

## Requisitos AWS

1. **Gerar uma chave pública** para acesso ao ambiente.
2. **Criar uma instância EC2** com o sistema operacional Amazon Linux 2:
   - Família: `t3.small`
   - Armazenamento: `16 GB SSD`
3. **Gerar um Elastic IP** e anexar à instância EC2.
4. **Liberar as portas de comunicação** para acesso público:
   - `22/tcp`
   - `111/tcp` e `udp`
   - `2049/tcp/udp`
   - `80/tcp`
   - `443/tcp`

## Documentação de Criação AWS

1. Acesse o serviço **EC2**.
2. Selecione **Instâncias** e clique em **Executar Instâncias**.
3. Adicione as **tags** conforme necessário.
4. Selecione a **AMI Amazon Linux 2**.
5. Escolha o tipo de instância como **`t3.small`**.
6. **Crie um novo par de chaves** (.pem).
7. Em **Configuração de Rede**, edite e mude o nome do grupo de segurança para fácil identificação.
8. Em **Regras de Segurança de Entrada**, adicione novas regras para liberar as portas especificadas acima.
9. Em **Configuração de Armazenamento**, mude de **8 GB** para **16 GB SSD**.
10. Clique em **Executar Instância**.
11. Selecione a instância e copie o **ID da VPC**.

### Configuração da VPC

1. Acesse o serviço **VPC**.
2. Vá até **Internet Gateway** e crie um novo **IGW**.
3. Associe o IGW à VPC copiada anteriormente.

### Configuração de IP Elástico

1. Acesse o serviço **IP Elástico**.
2. Alocar um novo endereço **IP Elástico**.
3. Selecione o IP e clique em **Ações** > **Associar Endereço**.

---

## Requisitos Linux

1. **Configurar o NFS**.
2. **Criar um diretório** dentro do filesystem do NFS com o seu nome.
3. **Subir um servidor Apache** e garantir que ele esteja online e rodando.
4. **Criar um script** que valide se o serviço está online e envie o resultado para o diretório NFS.
   - O script deve conter:
     - Data e hora
     - Nome do serviço
     - Status
     - Mensagem personalizada de online ou offline
   - O script deve gerar 2 arquivos de saída:
     - Um para o serviço online.
     - Outro para o serviço offline.
5. **Automatizar a execução do script** a cada 5 minutos.
6. **Fazer o versionamento** da atividade no GitHub.
7. **Documentar o processo** de instalação do Linux.

# Documentação de Configuração AWS e Linux

## Requisitos AWS

1. **Gerar uma chave pública para acesso ao ambiente.**
2. **Criar uma instância EC2 com o sistema operacional Amazon Linux 2:**
   - Tipo: t3.small
   - Armazenamento: 16 GB SSD
3. **Gerar um Elastic IP e anexar à instância EC2.**
4. **Liberar as portas de comunicação para acesso público:**
   - 22/tcp
   - 111/tcp e udp
   - 2049/tcp/udp
   - 80/tcp
   - 443/tcp

## Documentação para Criação da Parte da AWS

1. Acesse o serviço **EC2**.
2. Navegue até **Instâncias** e clique em **Executar instâncias**.
3. Adicione as tags necessárias para a **Compass**.
4. Selecione a **AMI Amazon Linux 2**.
5. Escolha o tipo de instância **t3.small**.
6. Crie um novo par de chaves (.pem).
7. Em **Configuração de rede**, edite o nome do grupo de segurança para fácil identificação.
8. Em **Regras do grupo de segurança de entrada**, adicione as portas necessárias para acesso público.
9. Em **Configuração de armazenamento**, ajuste para **16 GB SSD**.
10. Execute a instância.
11. Selecione a instância e copie o **ID da VPC**.

### Configuração de Rede

1. Acesse o serviço **VPC**.
2. Crie um **Internet Gateway (IGW)** e associe à VPC copiada.
3. Navegue até **IP Elástico**.
4. Alocar um novo **Endereço IP Elástico**.
5. Selecione o IP e associe à instância EC2.

## Requisitos Linux

1. **Configurar o NFS.**
2. **Criar um diretório dentro do filesystem do NFS com o meu nome.**
3. **Subir um Apache no servidor (o Apache deve estar online e rodando).**
4. **Criar um script que valide se o serviço está online e envie o resultado da validação para o diretório no NFS.**
   - O script deve conter:
     - Data e hora
     - Nome do serviço
     - Status
     - Mensagem personalizada de online ou offline
   - O script deve gerar 2 arquivos de saída:
     - 1 para o serviço online
     - 1 para o serviço offline
5. **Preparar a execução automatizada do script a cada 5 minutos.**
6. **Fazer o versionamento da atividade no GitHub.**
7. **Fazer a documentação explicando o processo de instalação do Linux.**

## Documentação para Criação da Parte do Linux

### Configuração do NFS

1. sudo su
2. yum update -y
3. yum install nfs-utils -y
4. mkdir -p /mnt/nfs
5. ls
6. cd /mnt/nfs
7. ls
8. ssh root@189.26.166.249
9. root@189.26.166.249's password: 
10. cd /mnt/nfs
11. ls

# Tutorial de Configuração e Monitoramento do Servidor Apache

## Criação de um Diretório com o Meu Nome
mkdir /mnt/nfs/laura
ls

## Subir um apache no servidor
yum install httpd -y
systemctl start httpd
systemctl enable httpd
systemctl status httpd

##Criação do script de monitoramento
vim /usr/local/bin/check_apache_status.sh

##Conteúdo do script
#!/bin/bash

# Configurações
LOG_DIR="/mnt/nfs/laura"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
SERVICE="httpd" 
STATUS=$(systemctl is-active httpd)

# Mensagens personalizadas
ONLINE_MESSAGE="Apache está online."
OFFLINE_MESSAGE="Apache está offline."

# Verificar o status do serviço e gerar os logs
#!/bin/bash

# Configurações
LOG_DIR="/mnt/nfs/laura"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
SERVICE="httpd" 
STATUS=$(systemctl is-active httpd)

# Mensagens personalizadas
ONLINE_MESSAGE="Apache está online."
OFFLINE_MESSAGE="Apache está offline."

# Verificar o status do serviço e gerar os logs
#!/bin/bash

# Configurações
LOG_DIR="/mnt/nfs/laura"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
SERVICE="httpd" 
STATUS=$(systemctl is-active httpd)

# Mensagens personalizadas
ONLINE_MESSAGE="Apache está online."
OFFLINE_MESSAGE="Apache está offline."

# Verificar o status do serviço e gerar os logs
#!/bin/bash

# Configurações
LOG_DIR="/mnt/nfs/laura"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
SERVICE="httpd" 
STATUS=$(systemctl is-active httpd)

# Mensagens personalizadas
ONLINE_MESSAGE="Apache está online."
OFFLINE_MESSAGE="Apache está offline."

# Verificar o status do serviço e gerar os logs
if [ "$STATUS" == "active" ]; then
    echo "Data e Hora: $TIMESTAMP" > "$LOG_DIR/apache_online.log"
    echo "Nome do Serviço: $SERVICE" >> "$LOG_DIR/apache_online.log"
    echo "Status: ONLINE" >> "$LOG_DIR/apache_online.log"
    echo "Mensagem: $ONLINE_MESSAGE" >> "$LOG_DIR/apache_online.log"
else
    echo "Data e Hora: $TIMESTAMP" > "$LOG_DIR/apache_offline.log"
    echo "Nome do Serviço: $SERVICE" >> "$LOG_DIR/apache_offline.log"
    echo "Status: OFFLINE" >> "$LOG_DIR/apache_offline.log"
    echo "Mensagem: $OFFLINE_MESSAGE" >> "$LOG_DIR/apache_offline.log"
fi

##Automatização do script a cada 5 minutos
1. crontab -e
2. */5 * * * * /usr/local/bin/check_apache_status.sh
3. crontab -l
4. cd /mnt/nfs
5. ls
6. cd /usr/local/bin
7. ls -l
   
   remover arquivos desnecessários
9. rm /usr/local/bin/check_apache_status.shenyesoap
10. rm /usr/local/bin/check_apache_status.shesoo
11. rm /usr/local/bin/check_apache_status.shy

  Verificar logs
12. cd /mnt/nfs/laura
13. ls -l
14. cat apache_online.log









