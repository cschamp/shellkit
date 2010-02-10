map g 1G
map e $
map - :n#
map , !}fmt -c
map ; !}fmt -c -w 57
set ai
set aw
set ts=3
set ht=4
set sw=3
set compatible
set expandtab
set number
map # :se invnumber
map & 1G!Gexpand -2
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * $Log: exrc,v $
" map @ :se noai1GO/* * $Id: exrc,v 1.2 2001/01/22 18:48:24 cschamp Exp schamp $ * * Revision 1.3  2002/11/09 00:52:47  schamp
" map @ :se noai1GO/* * $Id: exrc,v 1.2 2001/01/22 18:48:24 cschamp Exp schamp $ * * Tabstops (ts), hardtabs (ht), and shiftwidth (sw) set to 4.
" map @ :se noai1GO/* * $Id: exrc,v 1.2 2001/01/22 18:48:24 cschamp Exp schamp $ * *
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * Revision 1.2  2001/01/22 18:48:24  cschamp
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * Add proper RCS ID
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * *
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * Revision 1.1  2001/01/22 18:44:37  cschamp
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * Initial revision
" map @ :se noai1GO/* * $Id: exrc,v 1.3 2002/11/09 00:52:47 schamp Exp $ * * */:se ai
map  0i/* XXX $a */
map  07x$xxx
set hlsearch
set incsearch
" set background=light
" color jhlight
color greens
syntax on
if &background == "dark"
   highlight Comment cterm=bold ctermfg=green ctermbg=black
   highlight Search cterm=bold ctermfg=white ctermbg=cyan
endif
