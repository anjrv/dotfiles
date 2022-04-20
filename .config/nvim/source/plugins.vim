if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/bundle')
  Plug 'easymotion/vim-easymotion'
  " Plug 'neoclide/coc.nvim'
  " Plug 'Valloric/YouCompleteMe', { 'do' : 'python3 install.py --all' }
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'junegunn/fzf'
  Plug 'dracula/vim'
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'lervag/vimtex'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'mattn/emmet-vim'
  Plug 'conornewton/vim-pandoc-markdown-preview'
  Plug 'jschmold/sweet-dark.vim'
  Plug 'RRethy/vim-hexokinase', { 'do' : 'make hexokinase' }
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'frazrepo/vim-rainbow'
call plug#end()
