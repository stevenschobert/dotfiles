-- Initial setup ------------------------------------------------------------------------

  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

-- Keys ---------------------------------------------------------------------------------

  -- use comma as leader key
  vim.g.mapleader = ","

  -- Easier window switching
  vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>m", "<C-w><C-w>", { noremap = true, silent = true })

  -- Kill current buffer
  vim.api.nvim_set_keymap("n", "<leader>d", ":bd!<CR>", { noremap = true, silent = true })

  -- open file explorer
  vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Appearance ---------------------------------------------------------------------------

  require('kanagawa').setup({
    undercurl = true,    -- enable undercurls
    dimInactive = true,  -- dim inactive window
  })
  vim.cmd("colorscheme kanagawa")

-- Packer -------------------------------------------------------------------------------

  require("plugins")

-- nvim-tree ----------------------------------------------------------------------------

  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    git = {
      enable = false,
      ignore = false,
    },
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false
    },
  })
