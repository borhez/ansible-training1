echo -e "\033[35mupdate\033[30m"
apt update

echo -e "\033[35minstalling...\033[30m"
apt install ansible -y

mkdir /root/.ssh && cd /root/.ssh && ssh-keygen



