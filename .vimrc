"= Plugins =============================================================================

  " to install:
  "   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " see https://github.com/junegunn/vim-plug for details
  call plug#begin()

  " Plugs go here
  Plug 'sderev/alabaster.vim'
  Plug 'preservim/nerdtree'
  Plug 'mg979/vim-visual-multi'

  call plug#end()

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

  syntax enable                 " enable syntax highlighting
  set t_Co=256                  " set color count to 256

  " slate theme tweaks:
  "   - no background (inherit terminal color)
  "   - search highlights are gray/yellow
  " (note: because this is autocmd it needs to come before the :colorscheme call)
  if has('gui_running')
    set termguicolors
    set guifont=Menlo:h13,Monaco:h13,Courier\ New:h13,-monospace-:h13
    set transparency=5                " 5% transparent bg
    set blur=40                       " add blur radius to background

    autocmd ColorScheme slate hi Normal guibg=#111625
    autocmd ColorScheme slate hi Search guibg=DarkGray guifg=Yellow
    autocmd ColorScheme slate hi SpellBad guibg=DarkRed guifg=White

    " function! UpdateColorscheme()
    "   if v:os_appearance == 1  " 1 = dark, 0 = light
    "     colorscheme alabaster-dark
    "   else
    "     colorscheme alabaster
    "   endif
    " endfunction

    " autocmd OSAppearanceChanged * call UpdateColorscheme()

    " call UpdateColorscheme()

    colorscheme alabaster-dark
  else
    autocmd ColorScheme slate hi Normal guibg=NONE ctermbg=NONE
    autocmd ColorScheme slate hi Search ctermbg=DarkGray ctermfg=Yellow
    autocmd ColorScheme slate hi SpellBad ctermbg=DarkRed ctermfg=White

    colorscheme slate
  endif

  " use "██" for tabs and "∙" for trailing spaces
  set list listchars=tab:██,trail:∙

  set cursorline                " highlight the current line

"= Performance ========================================================================

  set synmaxcol=200             " turn off syntax on lines longer than 200 chars

"= Shortcuts ===========================================================================

  let mapleader = ','           " comma as leader key

  " turn of highlighted searches
  nmap <Leader>s :noh<CR>

  " File operations
  nmap <Leader>d :bd<CR>   " close buffer

  " NERDTree
  nmap <Leader>n :NERDTreeToggle<CR>

  " Buffer switching
  nmap ]b :bn<CR>
  nmap [b :bp<CR>

  " Compiling and fixing
  nmap <Leader>b :silent! setlocal makeprg=sh\ build.sh<CR>:make\|cw<CR><CR>
  nmap <Leader>r :! ./run.sh<CR>
  nmap <Leader>R :exe ':! ./debug.sh "'. expand('%') .':'. line('.') .':'. col('.') .'"'<CR><CR>
  nmap ]t :cnext<CR>
  nmap [t :cprev<CR>
  nmap ]T :cfirst<CR>
  nmap [T :clast<CR>

  " Easy window switching
  nmap <Leader>h :wincmd<space>h<CR>
  nmap <Leader>j :wincmd<space>j<CR>
  nmap <Leader>k :wincmd<space>k<CR>
  nmap <Leader>l :wincmd<space>l<CR>

  " Terminal
  " vim-powered terminal in split window
  map <Leader>t :term ++close<cr>
  tmap <Leader>t <c-w>:term ++close<cr>

  " vim-powered terminal in new tab
  map <Leader>T :tab term ++close<cr>
  tmap <Leader>T <c-w>:tab term ++close<cr>

"= Language Overrides ==================================================================

  autocmd FileType c setlocal softtabstop=4 shiftwidth=4 expandtab
  autocmd FileType cpp setlocal softtabstop=4 shiftwidth=4 expandtab
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType go setlocal listchars=tab:\ \ ,trail:∙

"= NERDTree =============================================================================

  let g:NERDTreeChDirMode = 2       " auto change working directory to match nerdtree root
  let g:NERDTreeQuitOnOpen = 1    " close file window on open

