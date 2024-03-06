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

  
  
  



