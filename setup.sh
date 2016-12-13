#!/usr/bin/env bash

ASDF_DIR="$HOME/.asdf"
OMZSH_DIR="$HOME/.oh-my-zsh"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
RUBY_VERSION="2.3.1"
NODE_VERSION="6.2.2"

# Repo setup
if !(cat "$HOME/.git/info/exclude" | grep -q \*$ 2>/dev/null); then
  echo "[setup] Excluding all files from git"
  echo "*" >> "$HOME/.git/info/exclude"
fi

# System flags
echo "[setup] Setting OS X preferences at $HOME/.osx/set_system_flags.sh"
sh "$HOME/.osx/set_system_flags.sh"

# Homebrew
# http://brew.sh
if !(hash brew 2>/dev/null); then
  echo "[setup] Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Homebrew bundle
# https://github.com/Homebrew/homebrew-bundle
if !(brew tap | grep -q homebrew/bundle 2>/dev/null); then
  echo "[setup] Installing homebrew/bundle"
  brew tap Homebrew/bundle
fi

# Homebrew deps
echo "[setup] Installing homebrew dependencies"
(cd "$HOME"; brew bundle)

# Asdf version manager
# https://github.com/HashNuke/asdf
if !(test -d "$ASDF_DIR" 2>/dev/null); then
  echo "[setup] Installing asdf"
  git clone https://github.com/HashNuke/asdf.git "$ASDF_DIR"
fi

# Temp add asdf to path
if !(hash asdf 2>/dev/null); then
  export PATH="$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH"
fi

# Ruby version manager plugin
if !(asdf plugin-list | grep -q ruby 2>/dev/null); then
  echo "[setup] Installing asdf plugin for ruby"
  asdf plugin-add ruby https://github.com/HashNuke/asdf-ruby.git
fi

# Nodejs version manager plugin
if !(asdf plugin-list | grep -q nodejs 2>/dev/null); then
  echo "[setup] Installing asdf plugin for nodejs"
  asdf plugin-add nodejs https://github.com/HashNuke/asdf-nodejs.git
fi

# TODO - Swift version manager

# Install ruby version
if !(asdf list ruby | grep -q "$RUBY_VERSION" 2>/dev/null); then
  echo "[setup] Installing ruby $RUBY_VERSION"
  asdf install ruby "$RUBY_VERSION"
fi

# Install nodejs version
if !(asdf list nodejs | grep -q "$NODE_VERSION" 2>/dev/null); then
  echo "[setup] Installing nodejs $NODE_VERSION"
  asdf install nodejs "$NODE_VERSION"
fi

# Set .tool-versions
if !(cat "$HOME/.tool-versions" | grep -q "ruby $RUBY_VERSION" 2>/dev/null); then
  echo "[setup] Setting ruby $RUBY_VERSION in $HOME/.tool-versions"
  echo "ruby $RUBY_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "nodejs $NODE_VERSION" 2>/dev/null); then
  echo "[setup] Setting nodejs $NODE_VERSION in $HOME/.tool-versions"
  echo "nodejs $NODE_VERSION" >> "$HOME/.tool-versions"
fi

# Bundler/Gems
if !(hash bundle 2>/dev/null); then
  echo "[setup] Installing bundler for ruby $RUBY_VERSION"
  gem install bundler
fi

echo "[setup] Installing global gems from $HOME/.ruby/Gemfile"
bundle install --gemfile="$HOME/.ruby/Gemfile"

# Nodejs packages
echo "[setup] Installing global node packages from $HOME/.node/install-global.sh"
sh "$HOME/.node/install-global.sh"

# Vundle
# https://github.com/VundleVim/Vundle.vim
if !(test -d "$VUNDLE_DIR" 2>/dev/null); then
  echo "[setup] Installing vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
fi

# Oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
if !(test -d "$OMZSH_DIR" 2>/dev/null); then
  echo "[setup] Installing Oh My Zsh"
  export ZSH="$OMZSH_DIR"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Set default shell
if [ "$SHELL" != "/bin/zsh" ]; then
  echo "[setup] setting default shell to zsh"
  chsh -s /bin/zsh
fi

echo "\n\n[setup] All done, have at it!"

exit 0;
