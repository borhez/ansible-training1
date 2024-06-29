## Check hosts (ubuntu docker containers)
1) Run start.sh 3 (создадутся 4 контейнера, один сервер-ansible и 3 управляемых ноды.
2) Fill inventory:
- cat hosts.yml
  172.18.0.2
  172.18.0.3
  172.18.0.4
- на сервере-ansible(172.18.0.5) выполнить: ansible all -i hosts.yml -m ping -u ansible
