-- Initial setup ------------------------------------------------------------------------

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Keys ---------------------------------------------------------------------------------

-- use comma as leader key
vim.g.mapleader = ','

-- Window switching
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', '<C-w><C-w>', { noremap = true, silent = true })

-- Window resizing
vim.api.nvim_set_keymap('n', '<leader>wc', '<C-w>c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wm', '<C-w>o', { noremap = true, silent = true })

-- Kill current buffer
vim.api.nvim_set_keymap('n', '<leader>d', ':bd!<CR>', { noremap = true, silent = true })

-- Open file explorer
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Custom Commands ----------------------------------------------------------------------

-- Quickly edit vim settings
vim.api.nvim_create_user_command('EditSettings', 'e $MYVIMRC', {})
vim.cmd('cnoreabbrev es EditSettings')

-- Packer -------------------------------------------------------------------------------

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'kyazdani42/nvim-tree.lua'
  use 'rebelot/kanagawa.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)

-- Appearance ---------------------------------------------------------------------------

require('kanagawa').setup({
  undercurl = true,    -- enable undercurls
  dimInactive = true,  -- dim inactive window
  globalStatus = true
})

require('indent_blankline').setup({
  show_current_context = true,
  show_current_context_start = true,
})

vim.cmd('colorscheme kanagawa')

-- Editing ------------------------------------------------------------------------------

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true              -- use spaces for <Tab> (hit <C-V><Tab> for hard tab)
vim.opt.shiftwidth = 2                -- number of spaces to use for indentaion step
vim.opt.listchars:append('trail:∙')   -- render trailing whitespaces as small middle dot
vim.opt.listchars:append('tab:██')    -- render hard tabs as white block
vim.opt.list = true                   -- turn on list mode (but use characters above)

-- nvim-tree ----------------------------------------------------------------------------

require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  git = {
    enable = false,
    ignore = false,
  },
  filters = {
    dotfiles = false,
  },
})

-- lualine ------------------------------------------------------------------------------

local lualine_colors = {
  blue   = '#7E9CD8',
  cyan   = '#7AA89F',
  black  = '#16161D',
  white  = '#DCD7BA',
  red    = '#FF5D62',
  violet = '#957FB8',
  grey   = '#54546D',
}
local lualine_theme = {
  normal = {
    a = { fg = lualine_colors.black, bg = lualine_colors.violet },
    b = { fg = lualine_colors.white, bg = lualine_colors.grey },
    c = { fg = lualine_colors.black, bg = lualine_colors.black },
  },

  insert = { a = { fg = lualine_colors.black, bg = lualine_colors.blue } },
  visual = { a = { fg = lualine_colors.black, bg = lualine_colors.cyan } },
  replace = { a = { fg = lualine_colors.black, bg = lualine_colors.red } },

  inactive = {
    a = { fg = lualine_colors.white, bg = lualine_colors.black },
    b = { fg = lualine_colors.white, bg = lualine_colors.black },
    c = { fg = lualine_colors.black, bg = lualine_colors.black },
  },
}

require('lualine').setup({
  options = {
    theme = lualine_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
})
