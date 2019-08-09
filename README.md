# steven's dotfiles

My workbench for writing software (and some stuff just for fun).

## Setup

__If you fork or clone this repo, please change `~/.gitconfig` file so you don't commit as me:__

> Note: You probably don't want to do actually do this, but its here for you to browse if you'd like! :)

```sh
cd ~
git init
git remote add origin git@github.com:stevenschobert/dotfiles.git
git pull origin master

./setup.sh
```

## Misc

## iCloud Drive Alias

I like to have an alias in my home directory that takes me to my iCloud drive:

```sh
cd ~
ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs iCloud
```

### Visual Tweaks

If you want to hide the readme and license files from your home directory, run these commands:

```sh
SetFile -a "V" ~/README.md
SetFile -a "V" ~/LICENSE
SetFile -a "V" ~/Brewfile
SetFile -a "V" ~/setup.sh
```

### Thanks

Thanks to [@soffes](https://github.com/soffes) for putting up [his dotfiles](https://github.com/soffes/dotfiles). I really liked the simplicity of his setup over others, and modeled this repo after his.
