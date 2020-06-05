" disable original vi compatible mode
set nocompatible
set autoindent
set smartindent
set wrap
set ruler
set nu
set laststatus=2
set showtabline=2
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-signify'
Plugin 'pangloss/vim-simplefold'
call vundle#end()

nmap <C-B> :NERDTreeToggle<CR>

filetype plugin indent on

colorscheme molokai
