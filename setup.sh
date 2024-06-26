#!/usr/bin/env bash

ASDF_DIR="$HOME/.asdf"
OMZSH_DIR="$HOME/.oh-my-zsh"
TPM_DIR="$HOME/.tmux/plugins/tpm"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
RUBY_VERSION="3.0.2"
NODE_VERSION="18.17.0"
DENO_VERSION="1.35.1"
JAVA_VERSION="adoptopenjdk-jre-8.0.252+9.1"
KOTLIN_VERSION="1.6.0"
PYTHON_VERSION="3.9.9"
GROOVY_VERSION="apache-groovy-binary-3.0.4"
GOLANG_VERSION="1.20.6"
ERLANG_VERSION="24.1.7"
HAXE_VERSION="4.3.3"
NEKO_VERSION="2.3.0"
RUST_VERSION="1.64.0"
PHP_VERSION="8.1.12"
OPAM_VERSION="2.1.6"
OCAML_VERSION="5.2.0"

PLATFORMSTR="$(uname -s)"

# Repo setup
if !(cat "$HOME/.git/info/exclude" | grep -q \*$ 2>/dev/null); then
  echo "[setup] Excluding all files from git"
  echo "*" >> "$HOME/.git/info/exclude"
fi

# Mac-specific setup
if [[ "$PLATFORMSTR" == "Darwin" ]]; then
  echo "[setup] Detected macOS installation, running optional mac setup"

  # System flags
  echo "[setup] Setting OS X preferences at $HOME/.osx/set_system_flags.sh"
  sh "$HOME/.osx/set_system_flags.sh"

  # Homebrew
  # http://brew.sh
  if !(hash brew 2>/dev/null); then
    echo "[setup] Installing homebrew..."
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
fi

# Tmux plugin manager
# https://github.com/tmux-plugins/tmp
if command -v tmux>/dev/null; then
  if !(test -d "$TPM_DIR" 2>/dev/null); then
    echo "[setup] Installing tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm.git "$TPM_DIR"
  fi
fi

# Asdf version manager
# https://github.com/HashNuke/asdf
if !(test -d "$ASDF_DIR" 2>/dev/null); then
  echo "[setup] Installing asdf"
  git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR"
fi

# Temp add asdf to path
if !(hash asdf 2>/dev/null); then
  export PATH="$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH"
fi

# Ruby version manager plugin
if !(asdf plugin-list | grep -q ruby 2>/dev/null); then
  echo "[setup] Installing asdf plugin for ruby"
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

# Nodejs version manager plugin
if !(asdf plugin-list | grep -q nodejs 2>/dev/null); then
  echo "[setup] Installing asdf plugin for nodejs"
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  # bash "$ASDF_DIR/plugins/nodejs/bin/import-release-team-keyring"
fi

# Deno version manager plugin
if !(asdf plugin-list | grep -q deno 2>/dev/null); then
  echo "[setup] Installing asdf plugin for deno"
  asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git
fi

# Java version manager plugin
if !(asdf plugin-list | grep -q java 2>/dev/null); then
  echo "[setup] Installing asdf plugin for java"
  asdf plugin-add java https://github.com/halcyon/asdf-java.git
fi

# Kotlin version manager plugin
if !(asdf plugin-list | grep -q kotlin 2>/dev/null); then
  echo "[setup] Installing asdf plugin for kotlin"
  asdf plugin-add kotlin https://github.com/missingcharacter/asdf-kotlin.git
fi

# Python version manager plugin
if !(asdf plugin-list | grep -q python 2>/dev/null); then
  echo "[setup] Installing asdf plugin for python"
  asdf plugin-add python https://github.com/danhper/asdf-python.git
fi

# Groovy version manager plugin
if !(asdf plugin-list | grep -q groovy 2>/dev/null); then
  echo "[setup] Installing asdf plugin for groovy"
  asdf plugin-add groovy https://github.com/weibemoura/asdf-groovy.git
fi

# Golang version manager plugin
if !(asdf plugin-list | grep -q golang 2>/dev/null); then
  echo "[setup] Installing asdf plugin for golang"
  asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
fi

# Erlang version manager plugin
if !(asdf plugin-list | grep -q erlang 2>/dev/null); then
  echo "[setup] Installing asdf plugin for erlang"
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
fi

# Haxe version manager plugin
if !(asdf plugin-list | grep -q haxe 2>/dev/null); then
  echo "[setup] Installing asdf plugin for haxe"
  asdf plugin-add haxe https://github.com/asdf-community/asdf-haxe.git
fi

# Neko version manager plugin
if !(asdf plugin-list | grep -q neko 2>/dev/null); then
  echo "[setup] Installing asdf plugin for neko"
  asdf plugin-add neko https://github.com/asdf-community/asdf-neko.git
  asdf haxe neko dylibs link # link neko dylibs
fi

# Rust version manager plugin
if !(asdf plugin-list | grep -q rust 2>/dev/null); then
  echo "[setup] Installing asdf plugin for rust"
  asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
fi

# Php version manager plugin
if !(asdf plugin-list | grep -q php 2>/dev/null); then
  echo "[setup] Installing asdf plugin for php"
  asdf plugin-add php https://github.com/asdf-community/asdf-php.git
fi

# Opam version manager plugin
if !(asdf plugin-list | grep -q opam 2>/dev/null); then
  echo "[setup] Installing asdf plugin for opam"
  asdf plugin-add opam https://github.com/asdf-community/asdf-opam.git
fi

# Ocaml version manager plugin
if !(asdf plugin-list | grep -q ocaml 2>/dev/null); then
  echo "[setup] Installing asdf plugin for ocaml"
  asdf plugin-add ocaml https://github.com/asdf-community/asdf-ocaml.git
fi

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

# Install deno version
if !(asdf list deno | grep -q "$DENO_VERSION" 2>/dev/null); then
  echo "[setup] Installing deno $DENO_VERSION"
  asdf install deno "$DENO_VERSION"
fi

# Install java version
if !(asdf list java | grep -q "$JAVA_VERSION" 2>/dev/null); then
  echo "[setup] Installing java $JAVA_VERSION"
  asdf install java "$JAVA_VERSION"
fi

# Install kotlin version
if !(asdf list kotlin | grep -q "$KOTLIN_VERSION" 2>/dev/null); then
  echo "[setup] Installing kotlin $KOTLIN_VERSION"
  asdf install kotlin "$KOTLIN_VERSION"
fi

# Install python version
if !(asdf list python | grep -q "$PYTHON_VERSION" 2>/dev/null); then
  echo "[setup] Installing python $PYTHON_VERSION"
  asdf install python "$PYTHON_VERSION"
fi

# Install groovy version
if !(asdf list groovy | grep -q "$GROOVY_VERSION" 2>/dev/null); then
  echo "[setup] Installing groovy $GROOVY_VERSION"
  asdf install groovy "$GROOVY_VERSION"
fi

# Install golang version
if !(asdf list golang | grep -q "$GOLANG_VERSION" 2>/dev/null); then
  echo "[setup] Installing golang $GOLANG_VERSION"
  asdf install golang "$GOLANG_VERSION"
fi

# Install erlang version
if !(asdf list erlang | grep -q "$ERLANG_VERSION" 2>/dev/null); then
  echo "[setup] Installing erlang $ERLANG_VERSION"
  asdf install erlang "$ERLANG_VERSION"
fi

# Install haxe version
if !(asdf list haxe | grep -q "$HAXE_VERSION" 2>/dev/null); then
  echo "[setup] Installing haxe $HAXE_VERSION"
  asdf install haxe "$HAXE_VERSION"
fi

# Install neko version
if !(asdf list neko | grep -q "$NEKO_VERSION" 2>/dev/null); then
  echo "[setup] Installing neko $NEKO_VERSION"
  asdf install neko "$NEKO_VERSION"
fi

# Install rust version
if !(asdf list rust | grep -q "$RUST_VERSION" 2>/dev/null); then
  echo "[setup] Installing rust $RUST_VERSION"
  asdf install rust "$RUST_VERSION"
fi

# Install php version
if !(asdf list php | grep -q "$PHP_VERSION" 2>/dev/null); then
  echo "[setup] Installing php $PHP_VERSION"
  LDFLAGS="-L/usr/local/opt/bison/lib" PATH="/usr/local/opt/bison/bin:$PATH" asdf install php "$PHP_VERSION"
fi

# Install opam version
if !(asdf list opam | grep -q "$OPAM_VERSION" 2>/dev/null); then
  echo "[setup] Installing ocaml $OPAM_VERSION"
  asdf install opam "$OPAM_VERSION"
fi

# Install ocaml version
if !(asdf list ocaml | grep -q "$OCAML_VERSION" 2>/dev/null); then
  echo "[setup] Installing ocaml $OCAML_VERSION"
  asdf install ocaml "$OCAML_VERSION"
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

if !(cat "$HOME/.tool-versions" | grep -q "deno $DENO_VERSION" 2>/dev/null); then
  echo "[setup] Setting deno $DENO_VERSION in $HOME/.tool-versions"
  echo "deno $DENO_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "java $JAVA_VERSION" 2>/dev/null); then
  echo "[setup] Setting java $JAVA_VERSION in $HOME/.tool-versions"
  echo "java $JAVA_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "kotlin $KOTLIN_VERSION" 2>/dev/null); then
  echo "[setup] Setting kotlin $KOTLIN_VERSION in $HOME/.tool-versions"
  echo "kotlin $KOTLIN_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "python $PYTHON_VERSION" 2>/dev/null); then
  echo "[setup] Setting python $PYTHON_VERSION in $HOME/.tool-versions"
  echo "python $PYTHON_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "groovy $GROOVY_VERSION" 2>/dev/null); then
  echo "[setup] Setting groovy $GROOVY_VERSION in $HOME/.tool-versions"
  echo "groovy $GROOVY_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "golang $GOLANG_VERSION" 2>/dev/null); then
  echo "[setup] Setting golang $GOLANG_VERSION in $HOME/.tool-versions"
  echo "golang $GOLANG_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "erlang $ERLANG_VERSION" 2>/dev/null); then
  echo "[setup] Setting erlang $ERLANG_VERSION in $HOME/.tool-versions"
  echo "erlang $ERLANG_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "haxe $HAXE_VERSION" 2>/dev/null); then
  echo "[setup] Setting haxe $HAXE_VERSION in $HOME/.tool-versions"
  echo "haxe $HAXE_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "neko $NEKO_VERSION" 2>/dev/null); then
  echo "[setup] Setting neko $NEKO_VERSION in $HOME/.tool-versions"
  echo "neko $NEKO_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "rust $RUST_VERSION" 2>/dev/null); then
  echo "[setup] Setting rust $RUST_VERSION in $HOME/.tool-versions"
  echo "rust $RUST_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "php $PHP_VERSION" 2>/dev/null); then
  echo "[setup] Setting php $PHP_VERSION in $HOME/.tool-versions"
  echo "php $PHP_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "opam $OPAM_VERSION" 2>/dev/null); then
  echo "[setup] Setting opam $OPAM_VERSION in $HOME/.tool-versions"
  echo "opam $OPAM_VERSION" >> "$HOME/.tool-versions"
fi

if !(cat "$HOME/.tool-versions" | grep -q "ocaml $OCAML_VERSION" 2>/dev/null); then
  echo "[setup] Setting ocaml $OCAML_VERSION in $HOME/.tool-versions"
  echo "ocaml $OCAML_VERSION" >> "$HOME/.tool-versions"
fi

# Ruby gems
# echo "[setup] Installing global gems from $HOME/.ruby/install-global.sh"
# bash "$HOME/.ruby/install-global.sh"

# Nodejs packages
# echo "[setup] Installing global node packages from $HOME/.node/install-global.sh"
# bash "$HOME/.node/install-global.sh"

# Vundle
# https://github.com/VundleVim/Vundle.vim
if !(test -d "$VUNDLE_DIR" 2>/dev/null); then
  echo "[setup] Installing vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
fi

# Oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh
# if !(test -d "$OMZSH_DIR" 2>/dev/null); then
#   echo "[setup] Installing Oh My Zsh"
#   export ZSH="$OMZSH_DIR"
#   sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# fi

# Set default shell
# if [ "$SHELL" != "/bin/zsh" ]; then
#   echo "[setup] setting default shell to zsh"
#   chsh -s /bin/zsh
# fi

#  Set default shell in macOS
if [[ "$PLATFORMSTR" == "Darwin" ]]; then
  if [ "$SHELL" != "/usr/local/bin/fish" ]; then
    echo "[setup] setting default shell to fish"
    echo /usr/local/bin/fish | sudo tee -a /etc/shells
    chsh -s /usr/local/bin/fish
  fi
fi

echo "[setup] All done, have at it!"

exit 0;
