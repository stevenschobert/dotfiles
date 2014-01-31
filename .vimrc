"= Initial setup ==================================================================================

  " use Vim settings, rather than Vi settings
  set nocompatible

  " initialize pathogen and rebuild helptags
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()

"= Vundle =========================================================================================

  " Vundle is short for 'Vim bundle' and is a Vim plugin manager.
  " See https://github.com/gmarik/vundle for more information

  Bundle 'gmarik/vundle'

  " Solarized color scheme
  Bundle 'altercation/vim-colors-solarized'

  " Pencil color theme for writing
  Bundle "reedes/vim-colors-pencil"

  " File/Folder Explorer
  Bundle 'scrooloose/nerdtree'

  " CoffeeScript syntax highlighting
  Bundle 'kchmck/vim-coffee-script'

  " JSON Formatting & Editing plugin
  Bundle 'elzr/vim-json'

  " Fuzzy file open plugin
  Bundle 'kien/ctrlp.vim'

  " JavaScript Syntax and indent
  Bundle "pangloss/vim-javascript"

  " Jade syntax and indent
  Bundle "digitaltoad/vim-jade"

  " Less syntax
  Bundle "groenewege/vim-less"

  " Syntax Checking
  Bundle "scrooloose/syntastic"

  " Comment-toggling plugin
  Bundle "scrooloose/nerdcommenter"

  " Ruby highlighting
  Bundle "vim-ruby/vim-ruby"

  " Ruby doend block completion
  Bundle "tpope/vim-endwise"

  " Instant markdown previews in browser
  Bundle "suan/vim-instant-markdown"

  " Status Bar
  Bundle "bling/vim-airline"

  " Bufferline
  Bundle "bling/vim-bufferline"

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

"= Theme ==========================================================================================

  set background=dark
  colorscheme solarized

  set hlsearch                            " highlight all search matches
  set colorcolumn=100                     " visual indicator at column 100
  set linespace=5                         " give the code some breathing room

  set list listchars=tab:██,trail:∙       " Use "██" for tabs and "∙" for trailing spaces
  set fillchars+=vert:                    " set vertical fillchar to "en space" (it's there, trust
                                          " me) for tab splits

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

