" Use Vim settings, rather than Vi settings
set nocompatible

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
set nojoinspaces
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

" Don't indent case statements farther than the switch
set cinoptions+=:0
" Don't indent scope declarations (public, private, protected)
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

" GUI options
set guifont=DejaVu\ Sans\ Mono\ 9
set guioptions-=mrLtT " Disable menus, toolbar, scrollbars
set browsedir=buffer " GUI open starts in dir of buffer's file

if has("gui_running")
  set columns=85
  set lines=45
endif

" Indentation exceptions
autocmd FileType c,cpp,cs,clay,d,java,ooc,rust setlocal sw=4 ts=4
autocmd FileType haskell setlocal sw=2 ts=2 et
autocmd FileType asm setlocal sw=8 ts=8 nosmartindent

" Filetypes
autocmd BufRead,BufNewFile *.apr set filetype=clojure

" Smarter %
runtime macros/matchit.vim

" Clear search highlights
nmap <silent> <leader>n :silent :nohlsearch<CR>

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

" Quickly navigate between window splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly edit and source this file
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Set the dictionary for ctrl-x ctrl-k word completion.
set dictionary=/usr/share/dict/words

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
set noshowmode
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:airline#extensions#whitespace#enabled = 0

Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
let g:syntastic_ruby_mri_exe='/usr/bin/ruby'
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git', 'svn']
let g:signify_sign_overwrite = 1
let g:signify_sign_change = '~'

Plug 'kien/ctrlp.vim'
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>e :CtrlP<CR>
nmap <leader>t :CtrlPTag<CR>
nmap <leader>l :CtrlPLine<CR>

Plug 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<Enter>

Plug 'tpope/vim-fugitive'
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

Plug 'gerw/vim-latex-suite'
let g:tex_flavor='latex' " Use latex-suite for .tex files.
let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
" Make grep always display file name, even for a single file, so as not to
" confuse latex-suite. Only difference from vim default is -H
set grepprg=grep\ -nH\ $*

Plug 'bitc/vim-hdevtools'
au FileType haskell nnoremap <buffer> <silent> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

Plug 'idris-hackers/idris-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'programble/jellybeans.vim'
Plug 'Raynes/refheap.vim'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

call plug#end()

" Because vim is too stupid to figure out these support 256 colors
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'xfce4-terminal'
  set t_Co=256
endif

" Use a nice colorscheme if 256 colors are available
if &t_Co == 256 || has("gui_running")
  colorscheme jellybeans
endif
