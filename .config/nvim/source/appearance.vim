" UI
set termguicolors
colorscheme dracula
" let g:airline_theme='minimalist'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:rainbow_active=1
set cmdheight=1
set noshowmode
set number relativenumber
set nu rnu
set wrap
set confirm
set ruler
set scl=no
set shortmess+=c
set pumheight=5
syntax on
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" Brackets
set showmatch
