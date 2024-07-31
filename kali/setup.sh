#!/usr/bin/sh

# install docker
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER

# install repo2docker
sudo pip install jupyter-repo2docker

# setup launch script
sudo curl -o /usr/share/icons/kestrel.svg https://raw.githubusercontent.com/opencybersecurityalliance/kestrel-lang/develop/logo/logo.svg
sudo curl -o /usr/share/applications/launcher.desktop https://raw.githubusercontent.com/opencybersecurityalliance/black-hat-us-2024/main/kali/launcher.desktop
sudo curl -o /usr/bin/kestrellab.sh https://raw.githubusercontent.com/opencybersecurityalliance/black-hat-us-2024/main/kali/kestrellab.sh
sudo chmod 755 /usr/bin/kestrellab.sh

echo "Please reboot."
