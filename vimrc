" Use Vim settings, rather than Vi settings.
set nocompatible

" Load pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Remap leader to ,
noremap \ ,
let mapleader = ","

" Place all backup files in ~/.vim/backup
set backup
set backupdir=~/.vim/backup

" General
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set ignorecase
set smartcase
set gdefault
set autoindent
set smartindent
set number
set title
set shortmess=atI
set visualbell t_vb=
set smarttab
set hlsearch
set textwidth=78
set formatoptions+=cqtrol
set shiftround
set hidden
set laststatus=2
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~

syntax on
filetype plugin indent on

" Default to 4-space indents, 4-character tabs
set expandtab
set shiftwidth=2
set tabstop=2

" Don't indent case statements farther than the switch.
set cinoptions+=:0
" Don't indent scope declarations (public, private, protected).
set cinoptions+=g0

" Visible trailing whitespace
set list
set listchars=tab:\ \ ,trail:·
" Hide trailing whitespace in insert mode
autocmd InsertEnter * setlocal nolist
autocmd InsertLeave * setlocal list

" Enable mouse in terminals
if has('mouse')
  set mouse=a
endif

" Indentation exceptions
autocmd FileType c,cpp,cs,clay,d,java,ooc,rust setlocal sw=4 ts=4
autocmd FileType haskell setlocal sw=2 ts=2 et
autocmd FileType asm setlocal sw=8 ts=8 nosmartindent

" Filetypes
autocmd BufRead,BufNewFile *.clay set filetype=clay
autocmd BufRead,BufNewFile *.ijs,*.ijt,*.ijp,*.ijx set filetype=j
autocmd BufRead,BufNewFile *.ll set filetype=llvm
autocmd BufRead,BufNewFile *.fth set filetype=forth
autocmd BufRead,BufNewFile *.apr set filetype=clojure
autocmd BufRead,BufNewFile *.apr call PareditInitBuffer()

" Custom indentation rules for Racket
set lispwords+=struct

" Smarter %
runtime macros/matchit.vim

" Swap ' and ` (the commands for jumping to marks.)
" Normally, ' is linewise and ` is exact.
nnoremap ' `
nnoremap ` '

" Clear search highlights
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Gist.vim options
let g:gist_clip_command = 'xclip -selection clipboard'

" Paste, yank, and delete with X11 CLIPBOARD instead of PRIMARY
nmap <leader>p "+p
nmap <leader>P "+P
nmap <leader>y "+y
nmap <leader>Y "+Y
nmap <leader>d "+d
nmap <leader>D "+D

" Use Q for formatting, not Ex mode
noremap Q gq

" Make Y an alias for y$ instead of yy
nnoremap Y y$

" Keybinding to toggle the undo tree
noremap <F5> :GundoToggle<CR>

" Because gnome-terminal is too stupid to set TERM=xterm-256color
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Use a nice colorscheme if 256 colors are available
if &t_Co == 256
  colorscheme jellybeans
endif

" Quickly edit and source this file
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Set the dictionary for ctrl-x ctrl-k word completion.
set dictionary=/usr/share/dict/words

" Make grep always display file name, even for a single file, so as not to
" confuse latex-suite. Only difference from vim default is -H.
set grepprg=grep\ -nH\ $*

" Use latex-suite for .tex files.
let g:tex_flavor='latex'

" Use xelatex to compile latex documents.
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'

" Airline config
let g:airline_left_sep = ''
let g:airline_right_sep = ''
set noshowmode
