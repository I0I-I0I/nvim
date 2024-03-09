let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/c/Users/azudj/scoop/apps/neovide/0.11.2
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 /mnt/d/code/learning/javascript/book/browser/3/theory/main.js
badd +1 /mnt/d/code/learning/javascript/book/browser/3/theory/index.html
badd +0 term:///mnt/d/code/learning/javascript/book/browser/3/theory//5677:/bin/zsh
badd +99 ~/.config/nvim/lua/core/mappings.lua
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit /mnt/d/code/learning/javascript/book/browser/3/theory/index.html
tcd /mnt/d/code/learning/javascript/book/browser/3/theory
argglobal
balt /mnt/d/code/learning/javascript/book/browser/3/theory/main.js
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
tabnext
edit ~/.config/nvim/lua/core/mappings.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
tcd ~/.config/nvim
argglobal
balt /mnt/d/code/learning/javascript/book/browser/3/theory/index.html
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 99 - ((19 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 99
normal! 027|
tabnext
tcd /mnt/d/code/learning/javascript/book/browser/3/theory
argglobal
if bufexists(fnamemodify("term:///mnt/d/code/learning/javascript/book/browser/3/theory//5677:/bin/zsh", ":p")) | buffer term:///mnt/d/code/learning/javascript/book/browser/3/theory//5677:/bin/zsh | else | edit term:///mnt/d/code/learning/javascript/book/browser/3/theory//5677:/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term:///mnt/d/code/learning/javascript/book/browser/3/theory//5677:/bin/zsh
endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 3 - ((2 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
tabnext 2
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
