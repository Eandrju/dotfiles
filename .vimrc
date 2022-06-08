" run this to install vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

"--- Vundle plugin manager
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-sensible'
call vundle#end()           
filetype plugin indent on 

"--- Basic
" choose no to be compatible with vi
set nocompatible
" tab options
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
set modeline
" doesn't need  a comment, but OCPD requires me to comment  
set encoding=utf-8
" always keep some contex lines around cursor
set scrolloff=3
" show line numbers
set number
" display options
set showmode showcmd
" hide buffer instead closing it
set hidden
" autocompletition of commands - first show list than match
set wildmode=longest:list,full
" enable fast scrolling
set ttyfast
" if you use at least one uppercase char, search becomes case-sensitive
set ignorecase smartcase
" you always want to s&r globaly in scope of a line  
set gdefault
" highlight all matching items
set hlsearch
" incremental search FTW!
set incsearch
" hightlight current line only in active pane
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END





"--- Leader
" choose <leader> key
let mapleader = " "
" clear search highlights
nnoremap <leader><space> :noh<cr>
" toggle Nerd Tree
nnoremap <leader>n :NERDTreeToggle<CR>
" source .vimrc
nnoremap <leader>@ :source ~/.vimrc<CR>
" clear spaces at the end of lines
nnoremap <leader>w :%s/\ \+$//<CR>''

"--- vim splitowindowtabs
" vim splits
nnoremap <leader>\| <C-w>v
nnoremap <leader>- <C-w>s
" open new split panes to right and bottom
set splitbelow
set splitright
" easier navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" swap top/bottom or left/right split
nnoremap <leader>r <C-w>r



"set pastetoggle=<leader>p

"--- Plugin configuration
" always show status line
set laststatus=2
" chose theme for lightline
let g:lightline = {'colorscheme': 'gruvbox',}

let g:SimpylFold_docstring_preview = 1
filetype plugin indent on    " required

let python_highlight_all=1
syntax on
set encoding=utf-8

set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.

set expandtab

autocmd BufNewFile,BufRead *.functions,*.aliases set filetype=sh

colorscheme gruvbox
set background=dark

