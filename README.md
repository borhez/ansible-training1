docker run -it -h server --name ubserv ubuntu  
apt update  
apt install openssh-server  
/etc/init.d/ssh start    или    service ssh start  
- проверим ssh localhost, фейл (просит пароль)  
  в папке /root/.ssh/ команда ssh-keygen
  cat id_rsa.pub >> authorized_keys
  ssh localhost , должна сработать  
То же самое проделываем для второго контейнера, ub1.
  
## Зайдём на сервер пользователем ub1:
- В главной ОС (не в контейнере) посмотрим ip для контейнера-ubserv:  
docker inspect --format '{{.NetworkSettings.IPAddress}}' ubserv  
- на сервере команда: adduser ub1 ;
- в контейнере ub1 проверяем вход на сервер (через пароль), ssh ub1@ip_serv (у меня: ssh ub1@172.17.0.2)
- для копирования ключей ssh, в ub1 делаем команду ssh-copy-id ub1 172.17.0.2 ;
- если всё хорошо, дальше на сервер заходим без пароля, только ssh ub@172.17.0.2 ;

  
  
  



