
# install brew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install basics
brew_install() {
  which "$1" || brew install "$1"
}

brew_install zsh
brew_install git
brew_install wget
brew_install curl

# ln subl
which subl || ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# other
which go || echo "TODO: install golang"
which ipfs || echo "TODO: install ipfs"
