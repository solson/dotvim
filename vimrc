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

" Default to 2-space indents, 2-character tabs
set expandtab
set shiftwidth=2
set tabstop=2

" Use Google C++ style
set cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4,N-s

if &encoding == 'utf-8'
  " Visible trailing whitespace
  set list
  set listchars=tab:\ \ ,trail:·
  " Hide trailing whitespace in insert mode
  autocmd InsertEnter * setlocal nolist
  autocmd InsertLeave * setlocal list
endif

" Enable mouse in terminals
if has('mouse')
  set mouse=a
endif

" GUI options
set guifont=DejaVu\ Sans\ Mono\ 9
set guioptions-=mrLtT " Disable menus, toolbar, scrollbars
set browsedir=buffer " GUI open starts in dir of buffer's file

" Indentation exceptions
autocmd FileType go setlocal noet
autocmd FileType asm setlocal sw=8 ts=8 nosmartindent

" Disable annoying as-you-type trailing whitespace highlighting
let go_highlight_trailing_whitespace_error = 0

" Filetypes
autocmd BufRead,BufNewFile *.apr set filetype=clojure
autocmd BufRead,BufNewFile SConstruct,SConscript set filetype=python

" Smarter %
runtime macros/matchit.vim

" Clear search highlights
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Paste from X11 clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P

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

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git', 'svn']
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
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
" Make grep always display file name, even for a single file, so as not to
" confuse latex-suite. Only difference from vim default is -H
set grepprg=grep\ -nH\ $*

Plug 'bitc/vim-hdevtools'
au FileType haskell nnoremap <buffer> <silent> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" Custom text objects library plugin
Plug 'kana/vim-textobj-user'
" `ai/ii/aI/iI` for a block of indented lines
Plug 'kana/vim-textobj-indent'
" `ac/ic` for a comment
Plug 'glts/vim-textobj-comment'
" `a,/i,` for a function parameter
Plug 'sgur/vim-textobj-parameter'

Plug 'Valloric/YouCompleteMe'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_globlist = ["~/code/*"]
let g:ycm_min_num_of_chars_for_completion = 99
nnoremap <silent> <leader>f :YcmCompleter GoTo<CR>
" Close preview window when leaving insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

Plug 'idris-hackers/idris-vim'
Plug 'programble/jellybeans.vim'
Plug 'Raynes/refheap.vim'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'travitch/hasksyn'

call plug#end()

" Because vim is too stupid to figure out these support 256 colors
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'xfce4-terminal'
  set t_Co=256
endif

" Use a nice colorscheme if 256 colors are available
if &t_Co == 256 || has("gui_running")
  colorscheme jellybeans
endif
