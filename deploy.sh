#!/bin/bash

# Update system and its dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common git

# Add Docker's official GPG key and set up the Docker stable repository
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index and install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone your repository (replace the token and URL with yours if different)
git clone https://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@github.com/mk1020/project1.git
mv ./mongo-init.js ./project1/

cd project1

# Start containers using Docker Compose
sudo docker-compose up --build -d


#instruction:
#1. replace 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 token with a new one (created in GitHub) since this one expires in 30 days.
#2. replace repository if needed
#3. your machne shoulbe Debian machine
#4. upload init-secrets.sh to VM, run chmod +x ./init-secrets.sh and then run ./init-secrets.sh
#4. upload this file to VM, run chmod +x ./deploy.sh and then run ./deploy.sh
#5. after that you can run "sudo docker-compose logs web" to see logs or "sudo docker-compose down" to shout down docker
#6. everything is ready, server works and you can connect to mongo via Studio 3t
