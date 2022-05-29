source ~/.config/nvim/source/plugins.vim
source ~/.config/nvim/source/binds.vim
source ~/.config/nvim/source/appearance.vim
source ~/.config/nvim/source/lang.vim

filetype plugin indent on

set clipboard+=unnamedplus
set encoding=utf-8
set hidden
set nowritebackup
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set cmdheight=1
set noshowmode
set number relativenumber
set signcolumn=yes
set colorcolumn=80
set nu rnu
set wrap
set confirm
set ruler
set scl=no
set shortmess+=c
set pumheight=5
set showmatch
syntax on

set completeopt=menuone,noselect

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Search options
set wildmenu
set incsearch
set hlsearch
set ignorecase
set smartcase
set nohlsearch

" History
set history=100
set undolevels=1000

" Whether mouse is enabled
set mouse=a

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Movement
" autocmd InsertEnter * norm zz
set scrolloff=8

" Faster update time
set updatetime=750

" Backspace beyond insert
set backspace=indent,eol,start

" Latex editing stuff
let g:vimtex_view_method = 'mupdf'
let g:vimtex_compiler_progname = 'nvr'
" Automatically update latex files
augroup TexAutoWrite
  autocmd FileType tex :autocmd! TexAutoWrite InsertLeave <buffer> :update
augroup END

" NERDTree
let g:NERDTreeIgnore = ['^node_modules$']

" Vimwiki
let g:vimwiki_list = [{'path' : '~/notes'}]

