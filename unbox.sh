#!/bin/bash

# Ensure that no existing dotfiles (that you want) are installed in $HOME otherwise stow will not link them.
echo 'By using this script you agree that the developers assume no liability for damages and you are fully responsible for your actions.'

user=$(whoami)
cwd=$(echo $PWD)

# prepare base packages
echo 'Preparing Base Packages'
# get update
sudo apt-get update -qq
# install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash
# install tmux
sudo apt install -y tmux
# install jq
sudo apt install -y jq
# install pipx
python3 -m pip install --user pipx && python3 -m pipx ensurepath
# install GoLang
sudo apt install -y golang
# install docker
curl -fsSL get.docker.com | sh

# restore dot files
echo 'Restoring Dot Files'
sudo apt install -y stow
cp -r ./dotfiles $HOME/
cd $HOME/dotfiles/zsh/ && tar -xf $HOME/dotfiles/zsh/dot-oh-my-zsh.tar.gz; rm -f $HOME/dotfiles/zsh/dot-oh-my-zsh.tar.gz
# stow all dotfiles
for dir in $HOME/dotfiles/*; do
  cd $HOME/dotfiles/ && stow --dotfiles $(echo $dir | awk '{gsub(/\/.*\//,"",$1); print}')
done

echo 'Configuring zsh'
# change default shell to zsh
sudo chsh -s $(which zsh) $user
touch $HOME/.z

# install Go Tools
echo 'Installing Go Tools'
for line in $(cat $cwd/config/tools.json | jq -r '.go[] | select(.v11=="false") | [.name,.url] | @csv')
do
  name="$(echo $line | cut -d "," -f 1 | tr -d '"')"
  url="$(echo $line | cut -d "," -f 2 | tr -d '"')"
  echo "Installing $name"
  sudo /bin/su -l $user -c "go get -u -v $url"
done

for line in $(cat $cwd/config/tools.json | jq -r '.go[] | select(.v11=="true") | [.name,.url] | @csv')
do
  name="$(echo $line | cut -d "," -f 1 | tr -d '"')"
  url="$(echo $line | cut -d "," -f 2 | tr -d '"')"
  echo "Installing $name" 
  sudo /bin/su -l $user -c "GO111MODULE=on go get -v $url"
done

# install Git Repos
echo 'Installing Git Repos'
for line in $(cat $cwd/config/tools.json | jq -r '.git[] | [.name,.url,.directory] | @csv')
do
  name="$(echo $line | cut -d "," -f 1 | tr -d '"')"
  url="$(echo $line | cut -d "," -f 2 | tr -d '"')"
  directory="$(echo $line | cut -d "," -f 3 | tr -d '"')"
  echo "Installing $name" 
  sudo /bin/su -l $user -c "git clone https://$url $directory"
done

# install Git Repos pt2 (ones that need intervention)
sudo git clone https://github.com/codingo/Interlace.git /opt/interlace && cd /opt/interlace/ && sudo python3 setup.py install
git clone https://github.com/blechschmidt/massdns.git /tmp/massdns && cd /tmp/massdns && make && sudo mv bin/massdns /usr/bin/massdns
wget -O /tmp/aquatone.zip https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip && cd /tmp/ && sudo unzip /tmp/aquatone.zip && sudo mv /tmp/aquatone $HOME/go/bin/aquatone
wget -O /tmp/amass.zip https://github.com/OWASP/Amass/releases/download/v3.11.1/amass_linux_amd64.zip && cd /tmp/ && sudo unzip /tmp/amass.zip && sudo mv /tmp/amass_linux_amd64/amass $HOME/go/bin/amass

# install Wordlists
echo 'Installing Wordlists'
for line in $(cat $cwd/config/tools.json | jq -r '.wordlists[] | [.name,.url,.directory] | @csv')
do
  name="$(echo $line | cut -d "," -f 1 | tr -d '"')"
  url="$(echo $line | cut -d "," -f 2 | tr -d '"')"
  directory="$(echo $line | cut -d "," -f 3 | tr -d '"')"
  echo "Installing $name" 
  sudo /bin/su -l $user -c "git clone https://$url $directory"
done

# install manual wordlists
mkdir -p $HOME/wordlists/{jhaddix,tomnomnom}
wget -O $HOME/wordlists/tomnomnom/short-wordlist.txt https://gist.githubusercontent.com/tomnomnom/57af04c3422aac8c6f04451a4c1daa51/raw/9f551e023ff17d093dcb9f8b355c3af55827cb34/short-wordlist.txt
wget -O $HOME/wordlists/jhaddix/content_discovery_all.txt https://gist.github.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt
wget -O $HOME/wordlists/jhaddix/dns_all.txt https://gist.github.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt
# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && cd /tmp/ && unzip awscliv2.zip && sudo ./aws/install
aws s3 sync s3://assetnote-wordlists/data/ $HOME/wordlists/assetnote-wordlists --no-sign-request

# end
echo 'Finished set up. Updating Machine...'
sudo bash $cwd/config/updater.sh
echo 'Completed!'
