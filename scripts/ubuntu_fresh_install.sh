#! bin/bash

# install applications
set -xe

echo "sudoers"
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a "/etc/sudoers.d/${USERNAME}"

echo "adding required repositories"
sudo add-apt-repository ppa:linrunner/tlp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt update

echo "install general programs and utils"
sudo apt install -y \
	inotify-tools vim terminator chromium-browser \
	tig ncdu zsh nethogs python-pip python3-pip tmux vlc \
	curl \
	wget audacious jq htop youtube-dl gnome-tweaks \
	mycli mysql-workbench chrome-gnome-shell openvpn \
	gnome-shell-extension-no-annoyance gnome-shell-extension-caffeine \
	nautilus-wipe nautilus-compare \
	net-tools libcanberra-gtk-module \
	tree shellcheck lastpass-cli bmon newsboat
	
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "installing snaps"
sudo apt install -y snapd

echo "installing spotify"
sudo snap install spotify

echo "installing Slack"
sudo snap install slack --classic

echo "installing postman"
sudo snap install postman

echo "installing VS Code and extensions"
sudo snap install vscode --classic
code --install-extension christian-kohler.path-intellisense
code --install-extension cliffordfajardo.hightlight-selections-vscode
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension humao.rest-client
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension mikestead.dotenv
code --install-extension ms-vscode.atom-keybindings
code --install-extension naumovs.color-highlight
code --install-extension oderwat.indent-rainbow
code --install-extension paulmolluzzo.convert-css-in-js
code --install-extension pranaygp.vscode-css-peek
code --install-extension Prisma.vscode-graphql
code --install-extension robertohuertasm.vscode-icons
code --install-extension SirTori.indenticator
code --install-extension TimonVS.ReactSnippetsStandard
code --install-extension wayou.vscode-todo-highlight
code --install-extension techer.open-in-browser
code --install-extension xabikos.JavaScriptSnippets

echo "Fix gnome calc so it calcs in search box ubuntu 18"
sudo snap remove gnome-calculator && sudo apt install gnome-calculator

echo "icons, gnome and fav gtk theme"
sudo add-apt-repository ppa:daniruiz/flat-remix \
	&& sudo apt-get update \
	&& sudo apt-get install -y flat-remix flat-remix-gtk flat-remix-gnome arc-theme 

echo "remove unity launcher"
sudo apt remove gnome-shell-extension-ubuntu-dock

echo "installing languages"
echo "installing git"
sudo apt install -y git

echo "setup nodejs"
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash - \
	&& sudo apt install nodejs
	# && sudo npm install -g n 

echo "intstalling golang"
sudo apt install -y \
	golang-go golint 

echo "installing aws cli"
sudo apt install awscli
#sudo -H pip3 install awscli --upgrade --user

echo "install docker"
curl -fsSL https://get.docker.com -o get-docker.sh \
	&& sudo sh get-docker.sh \
	&& sudo usermod -aG docker "${USERNAME}" \
	&& sudo service docker start

echo "install google sdk"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" \
	&& echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
	&& sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y

echo "install kubectl"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
	&& echo "deb https://apt.kubernetes.io/ kubernetes-$(lsb_release -c -s) main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
	sudo apt-get update && sudo apt-get install -y kubectl

# install virtualbox, version 6 is out now - grab that
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - \
# 	&& wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - \
# 	&& echo "deb https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee --append /etc/apt/sources.list \
# 	&& sudo apt-get update && sudo apt-get install -y virtualbox-5.2

echo "docker compose, make sure you have /bin dir symlinked first"
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose
sudo chmod +x ~/bin/docker-compose

echo "Oh my ZSH"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
echo "setting zsh as default"
chsh -s "$(which zsh)"

echo "install powerlevel9k"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

echo "install powerline fonts"
sudo apt install fonts-powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.config/fontconfig/conf.d
mkdir -p ~/.local/share/fonts/
cp PowerlineSymbols.otf ~/.local/share/fonts
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

echo "install awesome-powerline fonts"
git clone https://github.com/gabrielelana/awesome-terminal-fonts.git
mkdir .fonts
cp -R ~/awesome-terminal-fonts/build ~/.fonts
fc-cache -fv ~/.fonts
cp ~/awesome-terminal-fonts/config/10-symbols.conf ~/.config/fontconfig/conf.d
sed -i '5i\\
<alias>\
	<family>PragmataPro</family>\
		<prefer>\
			<family>Pomodoro</family>\
			<family>FontAwesome</family>\
			<family>Octicons</family>\
			<family>Icomoon</family>\
		</prefer>\
</alias>\
\\
' ~/awesome-terminal-fonts/config/10-symbols.conf
echo "add custom plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins

echo "configure .zshrc"
echo "" > ~/.zshrc
git clone https://gist.github.com/0c40228de8646913a3e62a3e21372883.git
cat .zshrc_gist >> .zshrc

echo "configure terminator"
echo "" > ~/.config/terminator/config
git clone https://gist.github.com/9e5177bbeba632adc2402acc7e4a8c73.git
cat terminator_config_gist >> ~/.config/terminator/config

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# gnome shell extensions from  https://extensions.gnome.org/
# https://extensions.gnome.org/extension/6/applications-menu/
# https://extensions.gnome.org/extension/517/caffeine/
# https://extensions.gnome.org/extension/906/sound-output-device-chooser/
# https://extensions.gnome.org/extension/1442/kube-config/
# https://extensions.gnome.org/extension/15/alternatetab/
# https://extensions.gnome.org/extension/1112/screenshot-tool/
# system monitor extensions
# sudo apt-get install -y gir1.2-gtop-2.0 gir1.2-networkmanager-1.0  gir1.2-clutter-1.0
# https://extensions.gnome.org/extension/120/system-monitor/


# other cool things
# bat replacement for cat - https://github.com/sharkdp/bat#installation
# exa - ls on steriods - https://the.exa.website/

sudo apt upgrade -y
sudo apt autoremove -y

