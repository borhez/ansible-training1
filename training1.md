docker run -it -h server --name ubserv ubuntu  
apt update  
apt install openssh-server  
/etc/init.d/ssh start    или    service ssh start  
- проверим ssh localhost, фейл (просит пароль)  
  в папке /root/.ssh/ команда ssh-keygen
  cat id_rsa.pub >> authorized_keys
  ssh localhost , должна сработать  
То же самое проделываем для других двух контейнеров , node1, node2.  
  
## Зайдём на сервер пользователем node11:
- В главной ОС (не в контейнере) посмотрим ip для контейнера-ubserv:  
docker inspect --format '{{.NetworkSettings.IPAddress}}' ubserv  
- на сервере команда: adduser node11 ;
- в контейнере ub1 проверяем вход на сервер (через пароль), ssh node1@ip_serv (у меня: ssh node1@172.17.0.2)
- для копирования ключей ssh, в node1 делаем команду ssh-copy-id node1@172.17.0.2 ;
- если всё хорошо, дальше на сервер заходим без пароля, только ssh node1@172.17.0.2 ;

После остановки и повторного запуска контейнеров, нужно запускать заново ssh , везде (server,node1,node2): sevice ssh start ;  
    
lsb_release -a узнаем версию OS  

## установим Ansible для нужной OS:

- apt install wget gpg ;
```
$ UBUNTU_CODENAME=jammy
$ wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list
$ sudo apt update && sudo apt install ansible
```

На сервере создадим пользователя ansible, создадим в /home/ansible файл .ssh/autorized_keys и скопируем в него паблик-ключи с node1 и node2.  
Поменяем владельца, и изменим права доступа:  
```
chown ansible:ansible /home/ansible/.ssh/autorized_keys
chmod 600 /home/ansible/.ssh/autorized_keys
```
apt install sudo (на сервере)  
visudo (в файле добавим строчку ansible ALL=(ALL:ALL) NOPASSWD: ALL  

  
  



