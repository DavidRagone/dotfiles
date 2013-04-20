syntax enable

" mappings
"imap jj <Esc>
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

" Highlight current line
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine cterm=NONE ctermbg=236

" NERDTree stuff
let NERDTreeQuitOnOpen = 0
" Open NERDTree if VIM opens with no files
"autocmd vimenter * if !argc() | NERDTree | endif
" \d opens a NERDTree that closes on file selection
nnoremap <Leader>d :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>
" \D opens a NERDTree that stays open on file selection
nnoremap <Leader>D :let NERDTreeQuitOnOpen = 0<bar>NERDTreeToggle<CR>
" toggle visibility of NERDTree
:nmap \e :NERDTreeToggle<CR>

" Powerline settings
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Explicitly tell vim that the terminal supports 256

" ctrlp settings
:nmap ; :CtrlPBuffer<CR>
" map opening of ctrlp to \t
":let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
" window on top
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Colors
let g:Powerline_symbols='fancy'

" Silence is golden
set vb t_vb=

" Highlight trailing whitespace
highlight ExtraWhitespace guibg=purple

" VUNDLE!
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" my bundles
Bundle 'scrooloose/nerdtree.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'tpope/vim-rails.git'
Bundle 'slim-template/vim-slim.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'jgdavey/vim-turbux.git'
Bundle 'thoughtbot/vim-rspec'


filetype plugin indent on
