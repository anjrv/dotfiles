filetype plugin indent on

let mapleader = " "

set clipboard+=unnamedplus
set encoding=utf-8
set hidden
set nowritebackup
set noerrorbells
set noswapfile
set nobackup
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
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
set scrolloff=8
set sidescrolloff=8

" Faster update time
set updatetime=300

" Backspace beyond insert
set backspace=indent,eol,start

" Replace d cut with delete
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" Nerdtree alternative
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END


function! ToggleNetrw()
        let i = bufnr("$")
        let wasOpen = 0
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile
    if !wasOpen
        silent Lexplore
    endif
endfunction

nmap <leader>e :call ToggleNetrw()<cr>
