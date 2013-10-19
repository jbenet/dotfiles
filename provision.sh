#!/bin/sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# install commandline tools
echo "Download the 'Commandline Tools for Xcode' from"
echo "https://developer.apple.com/downloads/"
echo ""
echo "Afterwards, press enter to continue."
read

# brew
brew install \
  git \
  zsh \
  mosh \
  tmux \
  curl \
  wget \
  libevent \
  swig \
  go \
  haskell-platform \

# gems
sudo gem install foreman

# eggs
sudo sh -c 'curl -q http://python-distribute.org/distribute_setup.py | python'
sudo easy_install pip

# dotfiles
echo "installing dotfiles..."
mkidr -p ~/git
cd ~/git
git clone git@github.com:jbenet/dotfiles.git
cd dotfiles
./install.sh

# app store apps
echo "App Store install:"
echo "- Divvy"
echo "- Monotony"
echo "- QuickCursor"
echo "- Caffeine"
echo "- QuickCal"
echo ""

# other apps
echo "Manually install:"
echo "- iTerm2"
echo "- Sublime Text 3"
echo "- Alfred 2"
echo "- Nocturne 2"
echo "- Spotify"
echo "- Chrome"
echo "- Virtualbox"
echo ""

echo "Goodbye!"
