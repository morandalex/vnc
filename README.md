# secure vnc on remote virtual machine 

![demo_vnc_hertzner-ezgif com-optimize (1)](https://github.com/morandalex/vnc/assets/9484568/68cd47c0-0e25-4660-ad0c-afebd02c7510)


## how to install on 


### Prerequisites

Before we begin, ensure that you have the following:

- A virtual machine instance from a cloud hosting provider like Hetzner
- SSH access to your virtual machine
- Basic knowledge of command-line operations

### Step 1: Create a Virtual Machine

Start by creating a virtual machine instance with your desired specifications (CPU, RAM, storage) from a cloud hosting provider like Hetzner. Make sure to choose a provider that offers data centers near your location for optimal performance.

### Step 2: Connect to the Virtual Machine via SSH
Once your virtual machine is set up, establish an SSH connection to it using a terminal or an SSH client. This will allow you to execute commands and configure the necessary components.

```bash
ssh user@your_vm_ip
```

### Step 3: Create a Swap File

To ensure smooth performance, create a swap file on your virtual machine. This will provide additional virtual memory when needed.

```bash
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

### Step 4: Install Docker

Docker will be used to run the VNC desktop container. 

### Step 5: Install Nginx

Install Nginx as a reverse proxy server to securely access your VNC desktop over HTTPS.

```bash
sudo apt update
sudo apt install nginx
```

Generate a self-signed SSL certificate for Nginx:
```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
```

### Step 6: Configure Nginx
Copy the provided Nginx site configuration file to the appropriate directory:

```bash
sudo cp vnc /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/vnc /etc/nginx/sites-enabled/
```
Verify the Nginx configuration:

```bash
sudo nginx -t
```

### Step 7: Set up Environment Variables

Create an .env file with the necessary environment variables, such as VNC password, HTTP password, resolution, and user credentials.

```bash
nano .env
```

```env
VNC_PASSWORD=your_vnc_password
RESOLUTION=1920x1080
HTTP_PASSWORD=your_http_password
USER=your_username
PASSWORD=your_user_password
```

### Step 8: Launch the VNC Desktop Container

Use the provided docker-compose.yml file to launch the VNC desktop container with the specified configurations.

```bash
docker compose up -d
```

### Step 9: Access the VNC Desktop

Open a web browser and navigate to https://<user>:<http_password>@<your_vm_ip>:6082. When prompted, enter the VNC password you set in the .env file. You should now have access to your remote VNC desktop.
