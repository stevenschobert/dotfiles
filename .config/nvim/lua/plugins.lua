return require('packer').startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "kyazdani42/nvim-tree.lua"
  use "rebelot/kanagawa.nvim"
end)
