" Read one day and make more changes:
" http://mixandgo.com/blog/vim-config-for-rails-ninjas

"****
"** General settings
  set re=1
  syntax enable
  syntax sync minlines=256
  set nocursorcolumn
  set nocursorline
  set relativenumber        " Show line numbers
  set number
  set hidden        " Allows hiding unsaved buffers
  set tabstop=4     " Tab characters = 4 spaces when displayed
  set shiftwidth=2  " Use 2 spaces for each insertion of (auto)indent
  set softtabstop=2 " Tabs 'count for' 2 spaces when editing (fake tabs)
  set expandtab     " <tab> -> spaces in insert mode
  set smarttab      " Smart tabbing!
  set scrolloff=10  " Mininum number of screen lines to keep above/below the cursor
  set list listchars=tab:»·,trail:· " Display extra whitespace
  set fdm=indent
  "http://superuser.com/questions/302186/vim-scrolls-very-slow-when-a-line-is-to-long
  set synmaxcol=200
  set ttyfast " u got a fast terminal
  set ttyscroll=3
  set lazyredraw " to avoid scrolling problems
  set colorcolumn=81
  " Highlight trailing whitespace
  highlight ExtraWhitespace guibg=purple
  " Silence is golden
  set vb t_vb=
  " Colors
  let g:Powerline_symbols='fancy'
  " Store swap files in fixed location, not current directory.
  set dir=~/.vimswap//,/var/tmp//,/tmp//,.
  " TODO - add helper to clear out all tmp files (for when computer has to be
  "   hard-restarted)
  " Highlight current line
  hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  "hi CursorLine cterm=NONE ctermbg=236
  " Set syntax highlighting for specific file types
  au BufRead,BufNewFile *.md set filetype=markdown
  " Enable spellchecking for Markdown
  au BufRead,BufNewFile *.md setlocal spell
  " Automatically wrap at 80 characters for Markdown
  au BufRead,BufNewFile *.md setlocal textwidth=80

"****
"** Search settings
  set hlsearch      " highlight matches
  set incsearch     " incremental searching
  set ignorecase    " searches are case insensitive...
  set smartcase     " ... unless they contain at least one capital letter

"****
"** Ctags settings
  set tags=.tags
  map <Leader>rt :! ctags --tag-relative --exclude=.git --languages=ruby -R * `rvm gemdir`/gems/*

"****
"** NERDTree settings
  let NERDTreeQuitOnOpen = 0
  nmap \e :NERDTreeToggle<CR>

"****
"** Powerline settings
  set nocompatible   " Disable vi-compatibility
  set laststatus=2   " Always show the statusline
  set encoding=utf-8 " Necessary to show unicode glyphs
  set t_Co=256       " Explicitly tell vim that the terminal supports 256

"****
"** ctrlp settings
  nmap ; :CtrlPBuffer<CR>
  " map opening of ctrlp to \k
  let g:ctrlp_map = '<Leader>k'
  let g:ctrlp_match_window_bottom = 0
  " window on top
  ":let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_dotfiles = 0
  let g:ctrlp_switch_buffer = 0
  " John Lee recommendations
  let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'

"****
"** Ruby helpers
  " When inside a method, leader + d to jump up to the name of the method
  "   (useful when inside some horrendously long method definition).
  "   To return to previous line, hit single-quote single-quote ('')
  nmap <leader>d ?^\s*def <CR> :let @/ = '' <CR>
  " ,h: Replace old hashrocket syntax with new 1.9.x syntax (in current line)
  map <silent> ,h :s/:\(\w\+\) =>/\1:/g<CR>j

"****
"** Rspec.vim mappings (disabled due to vimux conflict)
  "let g:rspec_command = "Dispatch zeus rspec {spec}"
  "let g:rspec_command = "Dispatch rspec {spec}"
  "map <Leader>t :call RunCurrentSpecFile()<CR>
  "map <Leader>s :call RunNearestSpec()<CR>
  "map <Leader>l :call RunLastSpec()<CR>
  "map <Leader>a :call RunAllSpecs()<CR>

"****
"** git mappings
  " Add all
  map <Leader>ga :! git add -A .
  " Add using patch
  map <Leader>gap :! git add -A -p
  " Commit
  map <Leader>ga :! git commit

"****
"** vimux mappings
  " configure vimux-ruby-test so ruby tests can run in 20% horizontal pane.
  let g:vimux_ruby_cmd_unit_test = "rspec"
  let g:vimux_ruby_cmd_all_tests = "rake"
  " Run the current file with rspec
  map <Leader>Tf :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
  " Run the current test
  map <Leader>Ts :RunRubyFocusedTest<CR>
  " Run last command executed by VimuxRunCommand
  map <Leader>vl :VimuxRunLastCommand<CR>
  " Inspect runner pane
  map <Leader>vi :VimuxInspectRunner<CR>
  " Close vim tmux runner opened by VimuxRunCommand
  map <Leader>vq :VimuxCloseRunner<CR>
  " Open vimux pane
  map <Leader>vo :VimuxOpenPane<CR>
  " Interrupt any command running in the runner pane
  map <Leader>vx :VimuxInterruptRunner<CR>
  " Zoom the runner pane (use <bind-key> z to restore runner pane)
  map <Leader>vz :call VimuxZoomRunner()<CR>

"****
"** Copy/Paste Settings
  " Yank text to the OS X clipboard
  noremap <leader>y "*y
  noremap <leader>yy "*Y
  " Preserve indentation while pasting text from the OS X clipboard
  noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"****
"** Vundle Settings
  filetype off "old?

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " " alternatively, pass a path where Vundle should install plugins
  " "call vundle#begin('~/some/path/here')

"****
"** Plugin List
  Bundle 'benmills/vimux'
  Bundle 'briancollins/vim-jst'
  Bundle 'gmarik/Vundle.vim'
  Bundle 'jgdavey/vim-turbux.git'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'kien/ctrlp.vim.git'
  Bundle 'Lokaltog/vim-powerline.git'
  Bundle 'mileszs/ack.vim'
  Bundle 'pangloss/vim-javascript'
  Bundle 'pgr0ss/vimux-ruby-test'
  Bundle 'scrooloose/nerdtree.git'
  Bundle 'scrooloose/syntastic.git'
  Bundle 'slim-template/vim-slim'
  Bundle 'thoughtbot/vim-rspec'
  Bundle 'tpope/vim-dispatch'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-rails.git'
  Bundle 'vim-ruby/vim-ruby.git'
  Bundle 'elixir-lang/vim-elixir'
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

