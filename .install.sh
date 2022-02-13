#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools and cocoapods..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew tap koekeishiya/formulae

# Brew Formulae
brew install gsl
brew install llvm
brew install ccls
brew install boost
brew install libomp
brew install armadillo
brew install mas
brew install miniconda
brew install jupyterlab
brew install neovim
brew install tree
brew install wget
brew install jq
brew install gh
brew install ripgrep
brew install neofetch
brew install wireguard-go
brew install lulu
brew install ifstat
brew install hdf5
brew install mactex
brew install starship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install skhd
brew install fyabai
brew install sketchybar
brew install sf-symbols

# Brew Casks
echo "Installing Brew Casks..."
brew install --cask inkscape
brew install --cask moonlight
brew install --cask mumble
brew install --cask libreoffice
brew install --cask flux
brew install --cask alacritty
brew install --cask spotify
brew install --cask monitorcontrol
brew install --cask sloth
brew install --cask zoom
brew install --cask skim
brew install --cask meetingbar
brew install --cask machoview
brew install --cask font-hack-nerd-font
brew install --cask vlc

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1451685025 #Wireguard
mas install 497799835 #xCode
mas install 1480933944 #Vimari

# Installing nvim and plant dotfiles
echo "Installing neovim config..."
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.615686 0.823529 0.454902"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:FelixKratz/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Python Packages
echo "Installing Python Packages..."
python -m ensurepip
pip3 install numpy
pip3 install pandas
pip3 install scipy
pip3 install sklearn
pip3 install tensorflow
pip3 install matplotlib
pip3 install tqdm
pip3 install tables
pip3 install python-language-server
pip3 install pylint
pip3 install pynvim
pip3 install proselint
pip3 install latex
pip3 install opencv-python

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start fyabai
brew services start sketchybar
brew services start svim

echo "Installing yabai scripting addition (!!sudo!!)"
sudo yabai --install-sa

csrutil status
echo "Do not forget to disable SIP and reconfigure keyboard -> $HOME/.config/keyboard..."
open "$HOME/.config/keyboard/KeyboardModifierKeySetup.png"
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
echo "Manual Install Needed: Alfred"
echo "Installation complete...\nRun nvim +PackerSync and Restart..."
