echo "update"
apt update
echo "ok"

echo "installing..."
apt install ansible -y
#apt install openssh-client
mkdir /root/.ssh && cd /root/.ssh && ssh-keygen
#ssh-copy-id ansible@host1
#ssh-copy-id ansible@host2
n=1
while [[ $n -le $1 ]] do
  ssh-copy-id ansible@host$n
  (( n++ ))
done 


