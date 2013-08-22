# steven/:house:

Home sweet home.

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

** If you fork or clone this repo, please change `~/.gitconfig` file so you don't commit as me:***

```
[user]
  name = Steven Schobert
  email = spschobert@gmail.com
```

### Visual Tweaks

If you want to hide the readme and license files from your home directory, run these commands:

```sh
SetFile -a "V" ~/README.md
SetFile -a "V" ~/LICESE
```

### Git Exclude

You can also update the repo to only allow manual `git add` commands:

```sh
echo '*' >> ~/.git/info/exclude
```

This will simply exclude everything. This will prevent the messy `git status` messages, and force changes to be tracked manually.

## Other Things

Here's some other things you'll probably want to install for more dev-happiness.

- [Homebrew](https://github.com/mxcl/homebrew/wiki/installation)
- [Rbenv](https://github.com/sstephenson/rbenv) and [ruby-build](https://github.com/sstephenson/ruby-build)

## Thanks

Thanks to @soffes for putting up [his dotfiles](https://github.com/soffes/dotfiles). I really liked the simplicity of his setup over others, and modeled this repo after his (pretty much copied actually).
