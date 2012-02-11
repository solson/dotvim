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
set autoindent
"set smartindent " TODO: What does this do?
set number
set title
set shortmess=atI
set visualbell t_vb=
set smarttab
set hlsearch
set textwidth=78
set formatoptions+=cqtrol

syntax on
filetype plugin indent on

" Default to 4-space indents, 4-character tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Don't indent the bodies of namespaces in C++
set cinoptions+=N-s
" Don't indent case statements farther than the switch.
set cinoptions+=:0

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
autocmd FileType ruby setlocal sw=2

" Filetypes
au BufRead,BufNewFile *.clay set filetype=clay
au BufRead,BufNewFile *.ijs,*.ijt,*.ijp,*.ijx set filetype=j
au BufRead,BufNewFile *.ll set filetype=llvm
au BufRead,BufNewFile *.fth set filetype=forth

" Enter insert mode automatically for `git commit`
au FileType gitcommit startinsert

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
map Q gq

" Toggle relative/absolute numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <silent> <C-n> :call NumberToggle()<cr>

" TODO: Look at wildmenu again.
" set wildmenu
" set wildmode=full (mine)
" set wildmode=list:longest (curtis')
" set wildignore=*.o,*.d,*~

