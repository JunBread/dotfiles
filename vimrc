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
" Show Tab autocomplete candidates
set wmnu
" Set indent width 4 spaces
set shiftwidth=4
set tabstop=4
" Remove 4 spaces at once
set smarttab
" Set IME compatible
set noimd
" Show matched parenthesis
set showmatch
" Highlight current line
set cursorline
" Enable mouse
set mouse=a
" Disable backup, swap
set noswapfile
set nobackup

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
Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
Plugin 'dracula/vim',{'name':'dracula'}

" Enable Vimwiki only if ~/.wiki.conf file is exists
if system("[[ -f ~/.wiki.conf ]] && printf true") == "true"
    Plugin 'vimwiki/vimwiki'
endif

call vundle#end()
filetype plugin indent on

" Custom Keymap
let maplocalleader = "\\"
command Q q

" Color Scheme
colorscheme dracula
if has("syntax")
    syntax on
endif

" Activate include files 
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor
