# vnc

## how to install on 

connect to a virtual machine via ssh and then  :
- on virtual machine create a swapfile
- install docker
- install nginx
- setup nginx site avalable -> check guide inside "vnc" file
- setup .env file
- make up 



when you have done 
go to the browser and find for 

    https://<user>:<http_password>@<ip>:6082

then add the vnc password



## install docker tips:

If you need help downloading docker check the following guide.

1. Update the package index:

```bash
    sudo apt-get update
```

2. Install packages to allow apt to use a repository over HTTPS:

```bash
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

3. Add Docker's official GPG key:

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

4. Set up the repository:

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
5. Install Docker Engine:

```bash
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

6. Verify that Docker Engine is installed correctly:
```
sudo docker run hello-world
```
