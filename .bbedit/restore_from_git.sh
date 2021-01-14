#!/usr/bin/env bash
THIS_DIR=$(dirname "$0")
DIRS_TO_COPY=(
  "Attachment Scripts"
  "Clippings"
  "Color Schemes"
  "Custom Keywords"
  "Language Modules"
  "Menu Scripts"
  "Scripts"
  "Setup"
  "Packages"
  "Text Filters"
)
BBEDIT_PATH="$HOME/Library/Application Support/BBEdit"
#BBEDIT_PATH="$HOME/Dropbox/Application Support/BBEdit"

for dir in "${DIRS_TO_COPY[@]}"
do
  rm -rf "$BBEDIT_PATH/$dir"
  cp -r "$THIS_DIR/$dir" "$BBEDIT_PATH/$dir"
done

# expert settings

# dash search off for ruby (i have a custom dash 
# lookup URL defined, that includes the language
# prefix dash://ruby:__SYMBOL_NAME__)
defaults write com.barebones.bbedit UseDashForReferenceLookups_Ruby -bool NO
defaults write com.barebones.bbedit "UseDashForReferenceLookups_C#/Mono" -bool NO
