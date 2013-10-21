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


"= Interface ======================================================================================

  "- Appearance -----------------------------------------------------------------------------------

    syntax on                    " turn on syntax highilghting

    filetype plugin on           " enable loading plugins for filetypes
    filetype indent on           " enable loading 'indent files' for filetypes

    set synmaxcol=200            " no syntax highlighting for lines longer than 200 cols

    set laststatus=2             " show status bar

    set number                   " display line numbers
    set visualbell               " use visual bell

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


"= Keys ===========================================================================================


"= Theme ==========================================================================================

  set background=dark
  colorscheme solarized

  set hlsearch                            " highlight all search matches
  set colorcolumn=100                     " visual indicator at column 100
  set linespace=5                         " give the code some breathing room

  set list listchars=tab:██,trail:∙       " Use "██" for tabs and "∙" for trailing spaces
  set fillchars+=vert:                    " set vertical fillchar to "en space" (it's there, trust
                                          " me) for tab splits
