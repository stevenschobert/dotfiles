-- Initial setup ------------------------------------------------------------------------

  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

-- Keys ---------------------------------------------------------------------------------

  -- use comma as leader key
  vim.g.mapleader = ","

  -- Window switching
  vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>m", "<C-w><C-w>", { noremap = true, silent = true })

  -- Window resizing
  vim.api.nvim_set_keymap("n", "<leader>wc", "<C-w>c", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>wm", "<C-w>m", { noremap = true, silent = true })

  -- Kill current buffer
  vim.api.nvim_set_keymap("n", "<leader>d", ":bd!<CR>", { noremap = true, silent = true })

  -- Open file explorer
  vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Custom Commands ----------------------------------------------------------------------

  vim.api.nvim_create_user_command('EditSettings', 'e $MYVIMRC', {})
  vim.cmd('cnoreabbrev es EditSettings')

-- Appearance ---------------------------------------------------------------------------

  require('kanagawa').setup({
    undercurl = true,    -- enable undercurls
    dimInactive = true,  -- dim inactive window
  })
  vim.cmd("colorscheme kanagawa")

-- Editing ------------------------------------------------------------------------------

  vim.opt.smartindent = true            -- slightly smarter indentation detection
  vim.opt.expandtab = true              -- use spaces for <Tab> (hit <C-V><Tab> for hard tab)
  vim.opt.shiftwidth = 2                -- number of spaces to use for indentaion step
  vim.opt.listchars:append("trail:∙")   -- render trailing whitespaces as small middle dot
  vim.opt.listchars:append("tab:██")    -- render hard tabs as white block
  vim.opt.list = true                   -- turn on list mode (but use characters above)

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
      dotfiles = false,
    },
  })


-- indent_blanline ----------------------------------------------------------------------

  require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
  })

