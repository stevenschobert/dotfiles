# steven's dotfiles

My workbench for writing software (and some stuff just for fun).

## Setup

__If you fork or clone this repo, please change `~/.gitconfig` file so you don't commit as me:__

> Note: You probably don't want to do actually do this, but its here for you to browse if you'd like! :)

```sh
cd ~
git init
git remote add origin git@github.com:stevenschobert/dotfiles.git
git fetch
git checkout -f master
```

## Misc

### Visual Tweaks

If you want to hide the readme and license files from your home directory, run these commands:

```sh
SetFile -a "V" ~/README.md
SetFile -a "V" ~/LICENSE
SetFile -a "V" ~/Brewfile
```