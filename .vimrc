"= Initial setup ==================================================================================

  " use Vim settings, rather than Vi settings
  set nocompatible
  filetype off

  " initialize pathogen and rebuild helptags
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

"= Vundle =========================================================================================

  " Vundle is short for 'Vim bundle' and is a Vim plugin manager.
  " See https://github.com/gmarik/Vundle.vim for more information

  Plugin 'gmarik/Vundle.vim'                      " package manager

  Plugin 'altercation/vim-colors-solarized'       " Solarized color scheme
  Plugin 'reedes/vim-colors-pencil'               " Pencil theme for writing
  Plugin 'tpope/vim-unimpaired'                   " awesome key shortucts
  Plugin 'scrooloose/nerdtree'                    " file/folder explorer
  Plugin 'kchmck/vim-coffee-script'               " coffee-script syntax
  Plugin 'elzr/vim-json'                          " better JSON editing
  Plugin 'kien/ctrlp.vim'                         " fuzzy file searching
  Plugin 'pangloss/vim-javascript'                " better javascript editing
  Plugin 'digitaltoad/vim-jade'                   " jade syntax
  Plugin 'groenewege/vim-less'                    " less syntax
  Plugin 'scrooloose/syntastic'                   " syntax checker
  Plugin 'scrooloose/nerdcommenter'               " easy comment toggling
  Plugin 'vim-ruby/vim-ruby'                      " better ruby editing
  Plugin 'tpope/vim-endwise'                      " block closing helper
  Plugin 'suan/vim-instant-markdown'              " preview markdown files
  Plugin 'bling/vim-airline'                      " status bar
  Plugin 'bling/vim-bufferline'                   " show buffers in status bar
  Plugin 'wavded/vim-stylus'                      " sylus syntax
  Plugin 'ap/vim-css-color'                       " show hex colors in files
  Plugin 'mattn/emmet-vim'                        " html key shortcuts
  Plugin 'Glench/Vim-Jinja2-Syntax'               " jinja2 syntax
  Plugin 'elixir-lang/vim-elixir'                 " elixir syntax
  Plugin 'mustache/vim-mustache-handlebars'       " mustache syntax
  Plugin 'heartsentwined/vim-emblem'              " emblem syntax

  call vundle#end()
  filetype plugin indent on

"= Interface ======================================================================================

  "- Appearance -----------------------------------------------------------------------------------

    syntax on                    " turn on syntax highilghting

    filetype plugin on           " enable loading plugins for filetypes
    filetype indent on           " enable loading 'indent files' for filetypes

    set synmaxcol=200            " no syntax highlighting for lines longer than 200 cols

    set laststatus=2             " show status bar

    set number                   " display line numbers
    set visualbell               " use visual bell

    set background=dark          " Dark background
    set laststatus=2             " Fix for statusbar toggling
    set encoding=utf-8           " Fix special character encoding
    set t_Co=256                 " MOAR COLOCS

  "- Interaction ----------------------------------------------------------------------------------

    set ttyfast                  " improve screen refresh for terminal vim
    set lazyredraw               " don't redraw while executing macros. async window title update
    set ttyscroll=3              " something about scrolling buffer size

    set scrolloff=3              " start scrolling 3 lines from bottom
    set sidescrolloff=6          " start scrolling 6 lines from right
    let loaded_match_paren = 1   " highlight matching parens

    set mouse=a                  " allow mouse usage

  "- Wrapping -------------------------------------------------------------------------------------

    set nowrap                   " don't softwrap text
    set formatoptions-=t         " don't automatically hardwrap text (use 'gq' to reflow text)
    set textwidth=100            " wrap at column 100
    set wrapmargin=0             " don't wrap based on terminal size

  "- Indentation ----------------------------------------------------------------------------------

    set autoindent               " indent next line to same level as current line
    set smartindent              "   ↑ but do it smartly
    set smarttab                 " <Tab> in front of a line inserts 'shiftwidth' blanks
    set shiftwidth=2             "   ↑ use 2 blanks for above
    set tabstop=2                " display a <Tab> as 2 spaces
    set softtabstop=2            " use 2 spaces for a <Tab>
    set expandtab

"= Utilities ======================================================================================

  set noswapfile               " don't create swap files

"= Keys ===========================================================================================

  let mapleader = ','                " set <Leader>
  set backspace=indent,eol,start     " Make backspace behave as expected

  " File operations (save, close, discard)
  nmap <Leader>f :w<bar>bd<CR>
  nmap <Leader>d :bd!<CR>

  " Quickly turn off highlighted search matches
  nmap <Leader>s :noh<CR>

  " Easy window switching
  nmap <Leader>h :wincmd<space>h<CR>
  nmap <Leader>j :wincmd<space>j<CR>
  nmap <Leader>k :wincmd<space>k<CR>
  nmap <Leader>l :wincmd<space>l<CR>

  " NERDTree
  nmap <Leader>n :NERDTreeToggle<CR>

  " Buffer switching
  nmap ]b :bn<CR>
  nmap [b :bp<CR>

  " Quick make commands
  nmap <Leader>mm :make<CR>
  nmap <Leader>mb :make build<CR>
  nmap <Leader>mc :make clean<CR>
  nmap <Leader>mt :make test<CR>
  nmap <Leader>ms :make start<CR>
  nmap <Leader>mi :make install<CR>

"= Theme ==========================================================================================

  set background=dark
  colorscheme solarized

  set hlsearch                            " highlight all search matches
  set colorcolumn=100                     " visual indicator at column 100
  set linespace=5                         " give the code some breathing room

  set list listchars=tab:██,trail:∙       " Use "██" for tabs and "∙" for trailing spaces
  set fillchars+=vert:                    " set vertical fillchar to "en space" (it's there, trust
                                          " me) for tab splits

"= File Types =====================================================================================

  au BufRead,BufNewFile *.sjs setf javascript       " JavaScript for sweet.js files
  au BufRead,BufNewFile .jshintrc setf json         " JSON for .jshintrc files

"= Vim-JSON  ======================================================================================

  let g:vim_json_syntax_conceal = 0       " turn off quote-concealing

"= NERDTree =======================================================================================

  let NERDTreeQuitOnOpen = 1              " Hide NERDTree when opening a file

"= Ctrl-p =========================================================================================

  " Don't use caching
  let g:ctrlp_use_caching = 0

  " Custom ignore paths
  let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules',
    \ }

"= Buffergator ====================================================================================

  let g:buffergator_suppress_keymaps = 1    " turn off default keymaps

"= Vim-Instant-Markdown ===========================================================================

  let g:instant_markdown_slow = 1        " dont update as much

"= Vim-Airline ====================================================================================

  let g:airline_powerline_fonts = 1     " use powerline fonts
  let g:airline_left_sep=''             " turn off arrows causing spacing issues
  let g:airline_right_sep=''            " turn off arrows causing spacing issues

"= Vim-Emmet ======================================================================================

  let g:user_emmet_leader_key='tt'   " remap leader key
  let g:user_emmet_mode='n'          "only enable normal mode functions.

