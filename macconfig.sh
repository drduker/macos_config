#!/bin/bash

# Manual Installs
# install oh-my-zsh (drops you into zsh and you must exit)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade && brew update
# xcode-select --install  #brew should auto install xcode tools

# #zsh changes:
# cd /usr/local/share/
# sudo chmod -R 755 zsh
# sudo chown -R root:staff zsh

cat << 'EOF' >> ~/.zshrc
source /usr/local/share/antigen/antigen.zsh

# random aliases:
alias workspace="cd ~/workspace/"
## git aliases:
#alias m="!f() { CURBRANCH=$(git rev-parse --abbrev-ref HEAD); git co \"$1\" && git pu && git merge $CURBRANCH && git p && git co $CURBRANCH; }; f"
alias co=checkout
alias ec=config --global -e
alias save="git add -A && git commit -m 'SAVEPOINT'"
alias wip="git add -u && git commit -m "WIP""
alias undo=reset HEAD~1 --mixed
alias amend=commit -a --amend
alias wipe=!git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard
#k8s
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias kall='kubectl get pods,namespaces,deployments'
# antigen
source ~/.antigen.zsh
antigen init ~/.antigenrc
export PATH="/usr/local/sbin:$PATH"
EOF
# antigen init ~/.antigenrc
cat << 'EOF' >> ~/.antigenrc
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle docker
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen theme robbyrussell
#antigen theme denysdovhan/spaceship-prompt
EOF

antigen apply

#BREW
brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git

brew install \
adns ansible antigen aom atk autoenv avro-c awscli \
bash-completion bash-git-prompt bdw-gc c-ares cairo \
clamav dav1d dep dockutil duti etcd fdupes ffmpeg flac \
fluxcd/tap/flux fontconfig freetype frei0r fribidi gcc gdbm gdk-pixbuf \
gettext giflib git git-lfs glib gmp gnupg gnutls go \
gobject-introspection gradle graphite2 gtk+ guile harfbuzz helm \
hicolor-icon-theme httpie icu4c isl jansson jemalloc \
jpeg jq jsonpp k3d kafkacat boz/repo/kail kompose googlecontainertools/kpt/kpt krb5 kubectx \
kubernetes-cli kubernetes-helm kustomize lame leptonica libass \
libassuan libbluray libev libevent libffi libgcrypt libgnt \
libgpg-error libidn libidn2 libimobiledevice libksba libmpc \
libogg libotr libplist libpng librdkafka libsamplerate libserdes \
libsndfile libsodium libsoxr libtasn1 libtiff libtool \
libunistring libusb libusbmuxd libvidstab libvorbis libvpx \
libyaml little-cms2 lz4 lzlib lzo mas maven mpfr ncurses nettle \
nghttp2 node npm npth oniguruma openconnect opencore-amr openjdk \
openjpeg openssl openssl@1.1 opus p11-kit pango pcre pcre2 \
pidgin pinentry pixman pkg-config postgresql python python3 \
rav1e readline rtmpdump rubberband sdl2 snappy sops speex sqlite \
srt sshuttle stern stoken swagger-codegen tcl-tk terraform \
tesseract theora ticker tig tmux tree unbound utf8proc vault \
watch webp wget x264 x265 xvid xz yajl yq zeromq zimg youtube-dl zsh zstd


# BREW CASKs
brew install \
amorphousdiskmark appgate-sdp-client authy barrier brave-browser \
cask google-chrome docker firefox ghidra gimp grandperspective handbrake \
inkscape iterm2 lens malwarebytes microsoft-teams privatevpn \
rectangle signal slack stats the-unarchiver tunnelblick vagrant \
virtualbox visual-studio-code vlc vmware-fusion wireshark zenmap \
zoomus brightness

#NPM
npm install git-pair

# VIM BOOTSTRAP?
# execute remove browser hardening/configuration scripts

# Configurations:
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 13
defaults write NSGlobalDomain com.apple.swipescrolldirection 0 # swipe direction
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.trackpad.scaling 3
defaults write com.apple.finder AppleShowAllFiles true; killall Finder 
defaults write -g AppleShowAllExtensions -bool true #show extensions
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true #Show full path in finder
chflags nohidden ~/Library #show user library
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "To live is Christ and to die is gain. - Philippians 1:21" # Login page txt
defaults write com.apple.digihub.blank.dvd.appeared -dict action -int 2
defaults write com.apple.digihub.blank.cd.appeared 2
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist # enable file sharing
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server.plist #enable file sharing EnabledServices -array disk
sudo systemsetup -setremotelogin on # enable ssh
defaults write com.apple.menuextra.battery ShowPercent YES
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d  h:mm:ss a"
killall SystemUIServer Finder
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
################[Enable Debug Mode]################
defaults write com.apple.addressbook ABShowDebugMenu -bool true
defaults write com.apple.iCal IncludeDebugMenu -bool true
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

brightness 1 # if you are using laptop

### Configuring the dock ###
dockutil --remove 'System Preferences' --allhomes
dockutil --remove 'News' --allhomes
dockutil --remove 'TV' --allhomes
dockutil --remove 'App Store' --allhomes
dockutil --remove 'Podcasts' --allhomes
dockutil --remove 'Reminders' --allhomes
dockutil --remove 'Mail' --allhomes
dockutil --remove 'Calendar' --allhomes
dockutil --remove 'Music' --allhomes
dockutil --remove 'Photos' --allhomes
dockutil --remove 'Maps' --allhomes
dockutil --remove 'Launchpad' --allhomes
dockutil --remove 'Safari' --allhomes
dockutil --remove 'Notes' --allhomes
dockutil --remove 'Contacts' --allhomes


# git setup;
curl -o ~/.gitignore https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore
echo '.*.sw[po]' >> ~/.gitignore

# Cleanup/Hardening
################[Remove IR support software]################"
rm -rf /System/Library/Extensions/AppleIRController.kext


# VSCODE Config:
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension hashicorp.terraform
code --install-extension ms-azuretools.vscode-docker 
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-python.python
code --install-extension ms-toolsai.jupyter
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode-remote.remote-wsl       
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.vscode-typescript-next  
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension shd101wyy\.markdown-preview-enhanced
code --install-extension TabNine.tabnine-vscode
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension usernamehw.errorlens
code --install-extension vscode-icons
code --install-extension formulahendry.auto-rename-tag
code --install-extension streetsidesoftware.code-spell-checker