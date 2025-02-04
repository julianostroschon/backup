#!/bin/bash

echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
sudo rm -rf /var/lib/apt/lists/lock

sudo apt-get remove docker docker-engine docker.io containerd runc -y

sudo apt update && sudo apt dist-upgrade -y && sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    git \
    zsh \
    lsb-release \
    dconf-cli \
    apt-transport-https -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
    
sudo apt-get update

sudo apt-get install docker-ce \
	docker-ce-cli \
	containerd.io \
	brave-browser \
	insomnia -y

sudo usermod -aG docker $USER

newgrp docker 

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose


cd && \
git clone https://github.com/dracula/gnome-terminal && \
cd gnome-terminal && ./install.sh && \
cd && rm -rf gnome-terminal

# sudo snap install sublime-text --classic
sudo snap install code --classic
sudo snap install dbeaver-ce
# sudo snap install rambox
sudo snap install telegram-desktop

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh
export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


source ~/.bashrc

nvm install v16


sudo reboot now

