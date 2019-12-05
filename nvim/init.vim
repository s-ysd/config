" set language as English
language en_US

" set encoding
set encoding=utf-8
scriptencoding utf-8


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/syoshida/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/syoshida/.cache/dein')
  call dein#begin('/Users/syoshida/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/syoshida/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
     call dein#add('roxma/nvim-yarp')
     call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  if !has('python')
     call dein#add('davidhalter/jedi-vim') " Use complete if using 'python'
     call dein#add('zchee/deoplete-jedi') " Show jedicompletion in .py file
  endif
  call dein#add('bronson/vim-trailing-whitespace') " Make invalid space redder
  call dein#add('ervandew/supertab') " Use tab-key for complete
  call dein#add('itchyny/lightline.vim') " make status line stronger
  call dein#add('lervag/vimtex') " Be able to complete for latex file
  call dein#add('maximbaz/lightline-ale') " Show ale results on the lightline
  call dein#add('scrooloose/nerdtree') " Be able to use folder tree
  call dein#add('thinca/vim-quickrun') " Be able to quick-run code
  call dein#add('Townk/vim-autoclose') " Automatically close the parenthesis
  call dein#add('w0rp/ale') " code_checker
  call dein#add('Yggdroot/indentLine') " Show indent line

  " Begin colorscheme list
  call dein#add('dracula/vim') " install many colorschemes
  call dein#add('flazz/vim-colorschemes') " install many colorschemes
  call dein#add('srcery-colors/srcery-vim') " colorscheme (https://github.com/srcersrcery-colors/srcery-vim)
  call dein#add('felipesousa/rupza') " colorscheme (https://github.com/felipesousa/rupza)
  call dein#add('Yggdroot/duoduo') " colorscheme (https://github.com/Yggdroot/duoduo)
  call dein#add('yuttie/hydrangea-vim') " colorscheme (https://github.com/yuttie/hydrangea-vim)
  call dein#add('flrnd/plastic.vim') " colorscheme (https://github.com/flrnd/plastic.vim)
  " End colorscheme list

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Setting of 'ale'
let g:ale_sign_column_always = 1 "Keep to show the symbol column on the left side.
let g:ale_statusline_format = ['E%d', 'W%d', 'ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-m> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_tex_chktex_options = "-n 8"

" Setting of 'colorscheme'
set background=dark
colorscheme duoduo

" Setting of 'deoplete.nvim'
let g:deoplete#enable_at_startup = 1

" Setting of 'jedi'
let g:jedi#completions_enabled = 0 " Force to off the completion of jedi itself

" Setting of 'lightline'
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ],
    \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
    \ },
    \ }

" Setting of 'lightline-ale'
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

" Setting of 'NERDTree'
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1 " Close NerdTree when you open files
let g:NERDTreeShowHidden=1 " Force to show hidden files

" Setting of 'QuickRun'
nnoremap <silent> <C-q> :QuickRun<CR>
let g:quickrun_config = {
\   "_" : {
\       "hook/time/enable" : 1
\   },
\}

" Setting of 'supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

" Setting of 'Vimtex'
let g:vimtex_quickfix_open_on_warning = 0

" Tab and indent
set autoindent " Continue former line's indent
set smartindent " Adjust the indent automatically
set shiftwidth=4 "The number how many spaces smartindent uses
set expandtab " Change Tab to multiple spaces
set tabstop=4 " The number how many spaces tab key input
set list
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%

"Window
" set nowrap
set splitright

" Search letters
set incsearch " Search by each 1 word
set ignorecase " NOT distinguish the size of characters
set smartcase " Distinguish the size of characters if you type Capital size
set hlsearch " Hilight of search results

" Cursor
set mouse=a " Enable to use mouse
set number " Show row number
set cursorline " Hilight cursorline

" Moving cursor for showing lines not row unit if row is wrapped
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Invalidate conceal
let g:tex_conceal=''

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
" https://superuser.com/questions/815416/hitting-enter-in-the-quickfix-window-doesnt-work
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Connect yank to clipboard (https://rcmdnk.com/blog/2019/05/27/computer-mac/)
set clipboard+=unnamedplus

" Set the default behavior to open .tex file
let g:tex_flavor = "latex"

" Set spell check
set spell
