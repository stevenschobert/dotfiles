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

  Plugin 'danilo-augusto/vim-afterglow'           " color scheme for term

  Plugin 'tpope/vim-unimpaired'                   " awesome key shortucts
  Plugin 'scrooloose/nerdtree'                    " file/folder explorer
  Plugin 'kien/ctrlp.vim'                         " fuzzy file searching
  Plugin 'terryma/vim-multiple-cursors'           " multiple cursor selection
  Plugin 'scrooloose/nerdcommenter'               " easy comment toggling
  Plugin 'vim-ruby/vim-ruby'                      " better ruby editing
  Plugin 'tpope/vim-endwise'                      " block closing helper
  Plugin 'itchyny/lightline.vim'                  " alternative status bar
  Plugin 'sstallion/vim-cursorline'               " show cursor line in current window
  Plugin 'ap/vim-css-color'                       " show hex colors in files
  Plugin 'mattn/emmet-vim'                        " html key shortcuts
  Plugin 'rizzatti/dash.vim'                      " Dash documentation search
  Plugin 'rking/ag.vim'                           " the_silver_search bindings
  Plugin 'godlygeek/tabular'                      " easy align columns
  Plugin 'ap/vim-buftabline'                      " show buffers in tabline
  Plugin 'mhinz/vim-startify'                     " fancy start screen

  Plugin 'mustache/vim-mustache-handlebars'       " mustache syntax
  Plugin 'elzr/vim-json'                          " better JSON editing
  Plugin 'heartsentwined/vim-emblem'              " emblem syntax
  Plugin 'Glench/Vim-Jinja2-Syntax'               " jinja2 syntax
  Plugin 'wavded/vim-stylus'                      " sylus syntax
  Plugin 'groenewege/vim-less'                    " less syntax
  Plugin 'pangloss/vim-javascript'                " better javascript editing
  Plugin 'digitaltoad/vim-jade'                   " jade syntax
  Plugin 'kchmck/vim-coffee-script'               " coffee-script syntax
  Plugin 'elixir-lang/vim-elixir'                 " elixir syntax
  Plugin 'leafgarland/typescript-vim'             " typescript syntax
  Plugin 'udalov/kotlin-vim'                      " kotlin syntax
  Plugin 'jdonaldson/vaxe'                        " haxe language

  " macOS only plugins
  if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
      Plugin 'zerowidth/vim-copy-as-rtf'          " copy out to OSX as RTF
      Plugin 'suan/vim-instant-markdown'          " preview markdown files
    endif
  endif

  call vundle#end()
  filetype plugin indent on

"= Interface ======================================================================================

  "- Appearance -----------------------------------------------------------------------------------

    syntax on                    " turn on syntax highlighting

    set t_Co=256                 " 256 color correction for non-gui vim

    let g:afterglow_inherit_background=1
    colorscheme afterglow

    filetype plugin on           " enable loading plugins for file types
    filetype indent on           " enable loading 'indent files' for file types

    set synmaxcol=200            " no syntax highlighting for lines longer than 200 cols

    set laststatus=2             " show status bar
    set noshowmode               " don't show insert mode (since already shown in status line)

    set number                   " display line numbers
    set visualbell               " use visual bell

    set laststatus=2             " Fix for status bar toggling
    set encoding=utf-8           " Fix special character encoding

    if has("gui_macvim")
      set guifont=MonoLisa:h14   " set font and size
      set linespace=0            " set line height
    endif

  "- Interaction ----------------------------------------------------------------------------------

    set ttyfast                  " improve screen refresh for terminal vim
    set lazyredraw               " don't redraw while executing macros. async window title update
    set ttyscroll=3              " something about scrolling buffer size

    set hidden                   " don't warn about unsaved changes on buffer switches

    set scrolloff=3              " start scrolling 3 lines from bottom
    set sidescrolloff=6          " start scrolling 6 lines from right
    let loaded_match_paren = 1   " highlight matching parentheses

    set mouse=a                  " allow mouse usage

    if has("gui_macvim")
      let macvim_hig_shift_movement = 1 " support shift-text select in macvim
    endif

  "- Wrapping -------------------------------------------------------------------------------------

    set nowrap                   " don't soft wrap text
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

    " Per-language overrides
    autocmd Filetype haxe setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

  "- Highlighting ---------------------------------------------------------------------------------

    hi SpellBad cterm=bold ctermfg=white ctermbg=darkred
    hi Search cterm=bold ctermfg=white ctermbg=brown

"= Utilities ======================================================================================

  set noswapfile               " don't create swap files
  set spell spelllang=en_us    " turn on spell check for US English

"= Keys ===========================================================================================

  let mapleader = ','                " set <Leader>
  set backspace=indent,eol,start     " Make backspace behave as expected

  set clipboard=unnamed              " to patch pbcopy with tmux

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

  " Test shortcuts
  nmap <silent> <leader>tn :TestNearest<CR>
  nmap <silent> <leader>tf :TestFile<CR>
  nmap <silent> <leader>ta :TestSuite<CR>
  nmap <silent> <leader>tl :TestLast<CR>
  nmap <silent> <leader>tv :TestVisit<CR>

  " Dash documentation search
  nmap <silent> <leader>- <Plug>DashSearch

"= Theme ==========================================================================================

  set hlsearch                            " highlight all search matches
  set colorcolumn=100                     " visual indicator at column 100

  set list listchars=tab:██,trail:∙       " Use "██" for tabs and "∙" for trailing spaces
  set fillchars+=vert:                    " set vertical fillchar to "en space" (it's there, trust
                                          " me) for tab splits

"= File Types =====================================================================================

  au BufRead,BufNewFile *.sjs setf javascript         " JavaScript for sweet.js files
  au BufRead,BufNewFile .jshintrc setf json           " JSON for .jshintrc files
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby   " Ruby for .jbuilder files

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

"= Vim-Instant-Markdown ===========================================================================

  let g:instant_markdown_slow = 1        " dont update as much

"= Vim-Lightline ====================================================================================

  let g:lightline = {
    \ 'colorscheme': 'OldHope',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', ], [ 'readonly' ] ],
    \   'right': [ [ 'lineinfo' ] ]
    \ },
    \ }

"= Vim-Emmet ======================================================================================

  let g:user_emmet_leader_key='tt'   " remap leader key
  let g:user_emmet_mode='n'          "only enable normal mode functions.

