set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

nnoremap <f2> :!C:\apps\batfiles\psql.bat %:p<cr>
nnoremap <f9> :botright vnew<cr>:read !C:\apps\batfiles\psql.bat #:p<cr>
nnoremap <f3> :!C:\apps\batfiles\sqlcmd.bat %:p <cr>
nnoremap <f4> :!explorer.exe %:h <cr>
nnoremap <f6> :!C:\apps\batfiles\psql.bat test.sql<cr>
set number

set relativenumber
set backup
set swapfile
set undofile
inoremap jk <ESC>
set undodir=c:\temp\.vim\tmp\undo\
set backupdir=c:\temp\.vim\tmp\backup\
set directory=c:\temp\.vim\tmp\swap\
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

nmap <f5> mz*crs:%s//<c-r><c-w>/g<cr>`z
nno <up> <Nop>
nno <left> <Nop>
nno <right> <Nop>
nno <down> <Nop>
inoremap <up> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <down> <Nop>
inoremap jj <esc>
nnoremap ,d :%s/\n$//g<cr>:g/^\s*$/d<cr>
let $PATH .= ';C:\Users\nguyenhu\AppData\Local\GitHub\PortableGit_d7effa1a4a322478cd29c826b52a0c118ad3db11\cmd'
call plug#begin('~/.vim/plugged')
" Put plugins here
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
call plug#end()
