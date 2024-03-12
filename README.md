# vnc

## how to install on 

connect tp a virtual machine via ssh and then  :
- install docker
- install nginx
- setup .env file
- make up 

If you need help downloading docker check the following guide 

## install docker tips:

Update the package index:

    sudo apt-get update

Install packages to allow apt to use a repository over HTTPS:

    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

Add Docker's official GPG key:

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

Set up the repository:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Install Docker Engine:

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

Verify that Docker Engine is installed correctly:

    sudo docker run hello-world
