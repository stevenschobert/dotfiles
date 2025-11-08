"= Initial setup ======================================================================

  set nocompatible              " don't try to be vi-compatible 
  filetype on                   " enable file type detection

"= Editing ============================================================================

  set encoding=utf-8            " use utf8 for encoding
  set nowrap                    " don't soft wrap text
  set spell spelllang=en_us     " turn on spell check for US English
  set noswapfile                " don't create swap files
  set hlsearch                  " highlight search matches
  set incsearch                 " highlight search matches as typing
  set scrolloff=3               " start scrolling 3 lines from top/bottom
  set sidescrolloff=6           " start scrolling 6 columns from left/right
  set autoindent                " preserve indentation when moving to insert mode
  set smartindent               " attempt to auto-indent for braces/brackets
  set expandtab                 " insert <Tab> as spaces
  set softtabstop=2             " set 2-space tabs (see option #2 in tabstop setting)
  set shiftwidth=2              " set 2-space tabs (see option #2 in tabstop setting)

"= Appearance =========================================================================

  syntax on                     " enable syntax highlighting

  " set termguicolors           " un-comment for blink on iOS
  set t_Co=256                  " set color count to 256

  " slate theme tweaks:
  "   - no background (inherit terminal color)
  "   - search highlights are gray/yellow
  " (note: because this is autocmd it needs to come before the :colorscheme call)
  autocmd ColorScheme slate hi Normal guibg=NONE ctermbg=NONE
  autocmd ColorScheme slate hi Search ctermbg=DarkGray ctermfg=Yellow

  colorscheme slate             " use slate color scheme

  " use "██" for tabs and "∙" for trailing spaces
  set list listchars=tab:██,trail:∙

  set cursorline                " highlight the current line

"= Performance ========================================================================

  set synmaxcol=200             " turn off syntax on lines longer than 200 chars

"= Shortcuts ===========================================================================

  let mapleader = ','           " comma as leader key

  " turn of highlighted searches
  nmap <Leader>s :noh<CR>

  " Buffer switching
  nmap ]b :bn<CR>
  nmap [b :bp<CR>

  " Easy window switching
  nmap <Leader>h :wincmd<space>h<CR>
  nmap <Leader>j :wincmd<space>j<CR>
  nmap <Leader>k :wincmd<space>k<CR>
  nmap <Leader>l :wincmd<space>l<CR>

"= Language Overrides ==================================================================

  autocmd FileType c setlocal softtabstop=4 shiftwidth=4 expandtab

