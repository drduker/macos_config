# macos_config
Get workstation up and running with more reasonable settings




```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install apps from homebrew #
brew install blueutil openconnect tmux watch tree jq
brew cask install spectacle
brew install minio/stable/mc
brew install aws-shell
brew install aws
brew install cloudfoundry/tap/credhub-cli
brew install cloudfoundry/tap/bosh-cli
brew install cloudfoundry/tap/cf-cli
brew install homebrew/cask/powershell
brew install homebrew/cask-versions/slack-beta
brew cask install microsoft-remote-desktop-beta
brew cask install iterm2-nightly
brew cask install atom
brew cask install sequel-pro
brew cask install keepingyouawake
brew cask install visual-studio-code
brew install zsh
gem install cf-uaac

#web development:
#sip



# install zoom #
cd ~/Downloads
curl -L --remote-name https://zoom.us/client/latest/zoomusInstaller.pkg
sudo installer -pkg zoomusInstaller.pkg -target /

#om-darwin
cd ~/Downloads
om_type=darwin
curl -L --remote-name $(curl -s https://api.github.com/repos/pivotal-cf/om/releases/latest | jq -r ".assets[] | select(.name | test(\"${om_type}\")) | .browser_download_url")
chmod +x om-darwin
mv om-darwin /usr/local/bin/om

# install concourse
cd ~/Downloads
concourse_type=concourse_darwin_amd64$
curl -L --remote-name $(curl -s https://api.github.com/repos/concourse/concourse/releases/latest | jq -r ".assets[] | select(.name | test(\"${concourse_type}\")) | .browser_download_url")
chmod +x concourse_darwin_amd64
mv concourse_darwin_amd64 /usr/local/bin/concourse


# install terraform
cd ~/Downloads
terraform=$(curl -s https://releases.hashicorp.com/terraform/|grep "/terraform"|head -n 1|sed -e 's/.*_\(.*\)<.*/\1/')
wget https://releases.hashicorp.com/terraform/${terraform}/terraform_${terraform}_darwin_amd64.zip
chmod +x terraform_${terraform}_darwin_amd64.zip
sudo mv terraform_${terraform}_darwin_amd64.zip /usr/local/bin/terraform

# install chrome #
cd ~/Downloads
curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg -o googlechrome.dmg
open ~/Downloads/googlechrome.dmg
sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
umount "/Volumes/Google Chrome"


# install fly-cli #
cd ~/Downloads
fly_type=fly_darwin_amd64$
curl -L --remote-name $(curl -s https://api.github.com/repos/concourse/concourse/releases/latest | jq -r ".assets[] | select(.name | test(\"${fly_type}\")) | .browser_download_url")
chmod +x fly_darwin_amd64
mv fly_darwin_amd64 /usr/local/bin/fly




# End of script' > vpnc-script-split-traffic.sh
chmod +x vpnc-script-split-traffic.sh

# install oh-my-zsh (drops you into zsh and you must exit)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# MacOS System Preferencess configurations:
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
defaults write NSGlobalDomain com.apple.swipescrolldirection 0
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.trackpad.scaling 3





# install vscode #
#cd ~/Downloads
#curl -o VSCode-darwin-stable.zip -L --remote-name https://go.microsoft.com/fwlink/?LinkID=620882
#cd /Applications
#unzip ~/Downloads/VSCode-darwin-stable.zip


#enable file sharing:
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server.plist EnabledServices -array disk

#enable ssh:
sudo systemsetup -setremotelogin on
```
