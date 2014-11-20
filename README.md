# steven's dotfiles

My workbench for writing software (and some stuff just for fun).

- Vim
- iTerm2
- Zsh
- Git
- Sublime Text 3
- DotJS
- Homebrew

![My editors](http://d.pr/i/1i6r5+)

## Requirements

Most everything here is simple config stuff, and is built on top of [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). You'll need to install that first.

```sh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
```

## Installation

```sh
cd ~
git init
git remote add origin git@github.com:stevenschobert/dotfiles.git
git pull origin master
```

__If you fork or clone this repo, please change `~/.gitconfig` file so you don't commit as me:__

```
[user]
  name = Steven Schobert
  email = spschobert@gmail.com
```

### Visual Tweaks

If you want to hide the readme and license files from your home directory, run these commands:

```sh
SetFile -a "V" ~/README.md
SetFile -a "V" ~/LICENSE
```

### Git Exclude

You can also update the repo to only allow manual `git add` commands:

```sh
echo '*' >> ~/.git/info/exclude
```

This will simply exclude everything. This will prevent the messy `git status` messages, and force changes to be tracked manually.

### Sublime Text

Symlink the folder to the Sublime Text application direction:

```sh
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/.sublime-text/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
```

- [Package Control](https://sublime.wbond.net/installation)

### Vim

Install [Vundle](https://github.com/gmarik/Vundle.vim):

```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open vim and install packages:

```
:PluginInstall
```

## Other Things

Here's some other things you'll probably want to install for more dev-happiness.

- [Homebrew](https://github.com/mxcl/homebrew/wiki/installation)
- [Rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build)

## Thanks

Thanks to [@soffes](https://github.com/soffes) for putting up [his dotfiles](https://github.com/soffes/dotfiles). I really liked the simplicity of his setup over others, and modeled this repo after his (pretty much copied actually).
