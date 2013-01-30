syntax enable
"call pathogen#infect()


" mappings
imap jj <Esc>
map ; :
  " Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y
  " Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" sets
set number        " Show line numbers
set tabstop=4     " Tab characters = 4 spaces when displayed
set shiftwidth=2  " Use 2 spaces for each insertion of (auto)indent
set softtabstop=2 " Tabs 'count for' 2 spaces when editing (fake tabs)
set expandtab     " <tab> -> spaces in insert mode
set smarttab      " Smart tabbing!
set scrolloff=10  " Mininum number of screen lines to keep above/below the cursor

" Searching (via https://github.com/seenmyfate/vim/blob/master/vimrc)
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter


" NERDTree stuff
let NERDTreeQuitOnOpen = 0
"  " Open NERDTree if VIM opens with no files
autocmd vimenter * if !argc() | NERDTree | endif
"  " \d opens a NERDTree that closes on file selection
nnoremap <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
"  " \D opens a NERDTree that stays open on file selection
nnoremap <Leader>D :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>

" Powerline settings
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Explicitly tell vim that the terminal supports 256

" Colors
let g:Powerline_symbols='fancy'


" VUNDLE!
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" my bundles
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'tpope/vim-rails.git'
Bundle 'mileszs/ack.vim'
Bundle 'jeetsukumaran/vim-buffergator.git'


filetype plugin indent on
