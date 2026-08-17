".vimrc
map g 1G
map e $
map - :n#
map , !}fmt -c
map ; !}fmt -c -w 57
set ai
set aw
set ts=3
set sw=3
set ht=4
map \ :se sw=8:se ts=8
set nocompatible
set expandtab
set number
set diffopt+=iwhite
map # :se invnumber
map & 1G!Gexpand -2
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * */:se ai
set hlsearch
set incsearch
set wildmenu
set smartcase
set spelllang=en_us
" Keep Vim's display visible after exiting.
set t_ti= t_te=
"
"Colors
autocmd BufRead,BufNewFile *.rs setfiletype rust
syntax enable
set background=dark
if has('termguicolors')
   set termguicolors
endif
" Set retrobox and then set it's background to be closer to black
colorscheme retrobox
highlight Normal guibg=#080808 ctermbg=232
" whitespace handling
highlight WhiteSpaceEOL cterm=underline ctermbg=NONE
   \ gui=undercurl guibg=NONE guisp=#fb5944
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/
"
" Language functions
function! PythonStuff()
   nnoremap <buffer> <C-X> 0i# XXX <Esc><CR>
   nnoremap <buffer> <C-P> 06x<CR>
   setlocal omnifunc=pythoncomplete#Complete
endfunction
function! PoundComment()
   nnoremap <buffer> <C-X> 0i# XXX <Esc><CR>
   nnoremap <buffer> <C-P> 06x<CR>
endfunction
function! CComment()
   nnoremap <buffer> <C-X> 0i/* XXX <Esc>$a */<Esc><CR>
   nnoremap <buffer> <C-P> 07x$xxx<CR>
endfunction
function! MakeStuff()
   nnoremap <buffer> <C-X> 0i# XXX <Esc><CR>
   nnoremap <buffer> <C-P> 06x<CR>
   setlocal noexpandtab
endfunction
autocmd FileType perl call PoundComment()
autocmd FileType python call PythonStuff()
autocmd FileType sh call PoundComment()
autocmd FileType c call CComment()
autocmd FileType cpp call CComment()
autocmd FileType make call MakeStuff()
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
