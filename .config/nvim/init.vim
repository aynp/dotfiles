set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set nu rnu                  " relative numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
"set clipboard+=unnamedplus
set clipboard=unnamedplus " using system clipboard

filetype plugin on
"set ttyfast                 " Speed up scrolling in Vim
"set spell                   " enable spell check (may need to download language package)
set noswapfile              " disable creating swap file
"set shell=bash

" Automatic installation of vim-plug, if it's not available
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'itchyny/lightline.vim'            " Status at bottom
    Plug 'sheerun/vim-polyglot'             " Syntax highlighting
    Plug 'preservim/nerdcommenter'          " Nerd Comments
    Plug 'nvim-lua/plenary.nvim'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'wakatime/vim-wakatime'
    "Plug 'mhartington/oceanic-next'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext

let g:catppuccin_flavour = "mocha"
let g:lightline = {'colorscheme': 'catppuccin'}

colorscheme catppuccin
