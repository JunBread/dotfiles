" Indent
set autoindent
set smartindent
" Search
set smartcase
set ignorecase
set hlsearch
set incsearch
" Line auto wrap
set wrap
" Show current cursor position
set ruler
" Show line number
set nu
" Always show status bar
set laststatus=2
" Always show tab bar
set showtabline=2
" Show Tab autocomplete
set wmnu
set shiftwidth=4
set tabstop=4

set noimd

set showmatch
set sm


set nocompatible
filetype off

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-signify'
Plugin 'pangloss/vim-simplefold'
Plugin 'vimwiki/vimwiki'
Plugin 'mhinz/vim-startify'
call vundle#end()
filetype plugin indent on

" Custom Keymap
nnoremap <C-B> :NERDTreeToggle<CR>

" Color Scheme
colorscheme molokai
if has("syntax")
	syntax on
endif

" Vimwiki
let wiki = {}
let wiki.path = '/mnt/c/Users/junbread/Projects/personal/wiki/_wiki'
let wiki.ext = '.md'

let g:vimwiki_list = [wiki]
let g:vimwiki_conceallevel = 0
