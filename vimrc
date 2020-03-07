" Golden Rule of vimrc: Don't put anything in your .vimrc you don't understand!

"**** Reference material:
  " https://dougblack.io/words/a-good-vimrc.html
  " (TO READ) http://mixandgo.com/blog/vim-config-for-rails-ninjas

"**** General settings {{{
  set nocompatible   " Disable vi-compatibility
  let mapleader = "," " leader is comma (I believe default is \)
  color vividchalk " best I've found so far for languages/filetypes I see often
  set guifont=monaco:h16
  set re=1
  syntax enable " TODO - same as below? (on vs enable)?
  syntax on
  syntax sync minlines=256
  set nocursorcolumn
  set ruler
  set cursorline     " Highlight the current line (subtly)
  set number         " Show line numbers...
  set relativenumber " ...and relative line numbers
  set hidden        " Allows hiding unsaved buffers
  set tabstop=2     " Tab characters = 2 spaces when displayed
  set shiftwidth=2  " Use 2 spaces for each insertion of (auto)indent
  set softtabstop=2 " Tabs 'count for' 2 spaces when editing (fake tabs)
  set expandtab     " <tab> -> spaces in insert mode
  set smarttab      " Smart tabbing!
  set nowrap        " TODO - ???
  set scrolloff=10  " Mininum number of screen lines to keep above/below the cursor
  set list listchars=tab:»·,trail:· " Display extra whitespace
  set foldmethod=indent " fold based on indent level. Alternatives: marker, manual, expr, syntax, diff. Run :help foldmethod
  set synmaxcol=200 "http://superuser.com/questions/302186/vim-scrolls-very-slow-when-a-line-is-to-long
  set ttyfast " u got a fast terminal
  set ttyscroll=3
  set lazyredraw " to avoid scrolling problems
  set colorcolumn=81
  " Highlight trailing whitespace
  highlight ExtraWhitespace guibg=purple
  " Silence is golden
  set vb t_vb=
  set showmatch " highlight matching [{()}]
  set wildmenu " visual autocomplete for command menu
  set foldenable " enable folding
  set foldlevelstart=3 " open first couple folds by default
  " highlight last inserted text. It visually selects the block of characters you added last time you were in INSERT mode.
  nnoremap gV `[v`]
  " Store swap files in fixed location, not current directory.
  set dir=~/.vimswap//,/var/tmp//,/tmp//,.
  " TODO - add helper to clear out all tmp files (for when computer has to be
  "   hard-restarted)
  " Highlight current line
  "hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  "hi CursorLine cterm=NONE ctermbg=236
  " Set syntax highlighting for specific file types
  au BufRead,BufNewFile *.md set filetype=markdown
  " Enable spellchecking for Markdown
  au BufRead,BufNewFile *.md setlocal spell
  " Automatically wrap at 80 characters for Markdown
  au BufRead,BufNewFile *.md setlocal textwidth=80
  " Add markdown syntax highlighting and spellcheck
  au BufRead,BufNewFile *.md set ft=markdown
  au BufRead,BufNewFile *.md setlocal spell
  au BufRead,BufNewFile *.md setlocal wrap
  map <leader>M :set syntax=markdown<CR>:set wrap<CR>:set spell<CR>
  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
  " Add json syntax highlighting
  au BufNewFile,BufRead *.json set ft=javascript
  " (Hopefully) removes the delay when hitting esc in insert mode
  set noesckeys
  set ttimeout
  set ttimeoutlen=1
  " Make it more obvious which paren I'm on
  hi MatchParen cterm=none ctermbg=black ctermfg=yellow
  " By default, vim thinks .md is Modula-2.
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" }}}

"**** Functions {{{
  function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
  endfunction
" }}}

"**** Improved copy/paste {{{
  " Copy current filename into system clipboard
  nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
  " Paste last contents of what was yanked regardless of what was deleted after
  nnoremap <leader>p "0p
  nnoremap <leader>P "0P
  " Copy to clipboard
  vnoremap <C-C> "*y
  " Toggle pasting to preserve format when pasting from clipboard into buffer
  nnoremap <leader>pt :set invpaste paste?<cr>
  set pastetoggle=<leader>pt
  set showmode
  " Yank text to the OS X clipboard // TODO - compare to above (merged 2
  " sections)
  noremap <leader>y "*y
  noremap <leader>yy "*Y
  " Preserve indentation while pasting text from the OS X clipboard
  noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
" }}}

"**** Better nav {{{
  set backspace=indent,eol,start " Fix problems with backspace in insert mode
  " Vertical split and move to new window
  nnoremap <leader>v <C-W>v<C-W>l
  " Horizontal split and move to new window
  nnoremap <leader>h :split<CR><C-W>j
  " Easier split navigation
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
" }}}

"**** Auto save/load {{{
  set autoread " Reload files changed outside vim
  set autowrite " Automatically :write before running commands
  " Remove trailing whitespace when manually saving a buffer
  fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun
  autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
" }}}

"**** Disable jsDoc trying to steal <C-l> {{{
  let g:jsdoc_default_mapping = 0
  if !hasmapto('<Plug>(jsdoc)')
    nnoremap <silent> <leader>d :call jsdoc#insert()<CR>
  endif
" }}}

"**** (DISABLED) Highlight after 80 characters {{{
  "augroup vimrc_autocmds
  "  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  "  autocmd BufEnter * match OverLength /\%80.*/
  "augroup END
" }}}

"**** Turn off backup files {{{
  set noswapfile
  set nobackup
  set nowb
" }}}

"**** Search settings {{{
  set hlsearch      " highlight matches
  set incsearch     " incremental searching
  set ignorecase    " searches are case insensitive...
  set smartcase     " ... unless they contain at least one capital letter
  " turn off search highlight by w/ ,<space>
  nnoremap <leader><space> :nohlsearch<CR>
  " Use silver searcher https://github.com/ggreer/the_silver_searcher#vim
  let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}

"**** Tab completion {{{
  set wildmode=list:longest,list:full
  set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" }}}

"**** Ctags settings {{{
  set tags=.tags
  map <Leader>rt :! ctags --tag-relative --exclude=.git --languages=ruby -R * `rvm gemdir`/gems/*
  " TODO - determine if want to use the below:
  "map <leader>rt :!ctags --extra=+f --exclude=tmp --exclude=node_modules -R * <CR><CR>
  "map <leader>lt :TlistToggle<CR>
  "let Tlist_Use_Right_Window = 1
  " Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
  let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
" }}}

"**** NERDTree settings {{{
  let NERDTreeQuitOnOpen = 0 " Close NERDTree when closing open vim window
  map <leader>nt :NERDTreeToggle<CR>
  map <leader>nf :NERDTreeFind<CR>
" }}}

"**** Powerline settings {{{
  set laststatus=2   " Always show the statusline
  set encoding=utf-8 " Necessary to show unicode glyphs
  set t_Co=256       " Explicitly tell vim that the terminal supports 256
  set showcmd        " Display incomplete commands
  let g:Powerline_symbols='fancy' " Colors
" }}}

"**** ctrlp settings {{{
  nmap ; :CtrlPBuffer<CR>
  let g:ctrlp_match_window_bottom = 0
  " window on top
  ":let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_dotfiles = 0
  let g:ctrlp_switch_buffer = 0
  " John Lee recommendation
  let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'
  " Make CtrlP use Ag for listing the files. Much faster and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}

"**** Ruby helpers {{{
  " When inside a method, leader + d to jump up to the name of the method
  "   (useful when inside some horrendously long method definition).
  "   To return to previous line, hit single-quote single-quote ('')
  nmap <leader>d ?^\s*def <CR> :let @/ = '' <CR>
  " ,h: Replace old hashrocket syntax with new 1.9.x syntax (in current line)
  map <silent> ,h :s/:\(\w\+\) =>/\1:/g<CR>j
" }}}

"**** git mappings {{{
  " Add all
  map <Leader>ga :! git add -A .
  " Add using patch
  map <Leader>gap :! git add -A -p
  " Commit
  map <Leader>ga :! git commit
" }}}

"**** vim-rspec mappings {{{
  let g:rspec_command = 'call Send_to_Tmux("rspec {spec} --fail-fast \n")'
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>
" }}}

"**** Syntastic settings {{{
  " Enable syntastic syntax checking
  let g:syntastic_enable_signs=1
  let g:syntastic_quiet_messages = {'level': 'warnings'}
  let g:syntastic_javascript_checkers = ['eslint']
" }}}

"**** golang settingns {{{
  let g:go_disable_autoinstall = 0

  " Highlight
  let g:go_highlight_functions = 1  
  let g:go_highlight_methods = 1  
  let g:go_highlight_structs = 1  
  let g:go_highlight_operators = 1  
  let g:go_highlight_build_constraints = 1  
" }}}

"**** Tmux support {{{
  " allows cursor change in tmux mode
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
" }}}

"**** Vundle Settings {{{
  filetype off "old?

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " " alternatively, pass a path where Vundle should install plugins
  " "call vundle#begin('~/some/path/here')
" }}}

"**** Plugin List {{{
  Plugin 'benmills/vimux'
  Plugin 'briancollins/vim-jst'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'heavenshell/vim-jsdoc' " JSDoc
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'jgdavey/tslime.vim.git'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'kien/ctrlp.vim.git'
  Plugin 'Lokaltog/vim-powerline.git'
  Plugin 'mileszs/ack.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'pgr0ss/vimux-ruby-test'
  Plugin 'scrooloose/nerdtree.git'
  Plugin 'scrooloose/syntastic.git'
  Plugin 'slim-template/vim-slim'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-rails.git'
  Plugin 'tpope/vim-jdaddy'
  Plugin 'vim-ruby/vim-ruby.git'
  Plugin 'fatih/vim-go'
  Plugin 'vim-ember-hbs'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
" }}}

" vim:foldmethod=marker:foldlevel=0

