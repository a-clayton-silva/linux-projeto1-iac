#!/bin/bash

## Script para criar pastas, usuarios, senhas e atribuir permissoes

## comando para criacao de pasta
echo "1 - Criando pastas"
sudo mkdir /publico
sudo mkdir /adm
sudo mkdir /ven
sudo mkdir /sec

## comanddo para criacao de grupo de usuario
echo "2 - Criando grupos"
sudo groupadd grp_adm
sudo groupadd grp_ven
sudo groupadd grp_sec

## comando para criacao de usuario e troca de senha no primeiro login
## ATENCAO, USUARIO E SENHA NO PRIMEIRO LOGON É O MESMO
## Usuario precisa trocar a senha no primeiro acesso
echo "3 - Criando usuario"

sudo useradd carlos -m -c "carlos albuquerque" -s /bin/bash -p $(openssl passwd -6 carlos)
sudo passwd carlos -e

sudo useradd maria -m -c "maria mercedes" -s /bin/bash -p $(openssl passwd -6 maria)
sudo passwd maria -e

sudo useradd joao -m -c "joao canabrava" -s /bin/bash -p $(openssl passwd -6 joao)
sudo passwd joao -e

sudo useradd debora -m -c "debora seco" -s /bin/bash -p $(openssl passwd -6 debora)
sudo passwd debora -e

sudo useradd sebastiana -m -c "sebastiana mendonca" -s /bin/bash -p $(openssl passwd -6 sebastiana)
sudo passwd sebastiana -e

sudo useradd roberto -m -c "roberto carlos" -s /bin/bash -p $(openssl passwd -6 roberto)
sudo passwd roberto -e

sudo useradd josefina -m -c "josefina santos" -s /bin/bash -p $(openssl passwd -6 josefina)
sudo passwd josefina -e

sudo useradd amanda -m -c "amanda silva" -s /bin/bash -p $(openssl passwd -6 amanda)
sudo passwd amanda -e

sudo useradd rogerio -m -c "rogerio ceni" -s /bin/bash -p $(openssl passwd -6 rogerio)
sudo passwd rogerio -e

## alterando as permissoes das pastas
sudo chmod 777 /publico
sudo chown root:grp_adm /adm
sudo chmod 770 /adm
sudo chown root:grp_ven /ven
sudo chmod 770 /ven
sudo chown root:grp_sec /sec
sudo chmod 770 /sec

## incluindo usuario ao grupo
sudo usermod -G grp_adm carlos
sudo usermod -G grp_adm maria
sudo usermod -G grp_adm joao
sudo usermod -G grp_ven debora
sudo usermod -G grp_ven sebastiana
sudo usermod -G grp_ven roberto
sudo usermod -G grp_sec josefina
sudo usermod -G grp_sec amanda
sudo usermod -G grp_sec rogerio


## exibindo resultado final
echo "### PASTAS DOS USUARIOS ##"
ls /home
echo "### GRUPOS CRIADOS ###"
cat /etc/group | grep grp_

echo "### FIM ###"

## melhorar o codigo nas proximas versoes 
