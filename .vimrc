call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()


set rnu
set nu
syntax on
set backspace=indent,eol,start

nnoremap Zz ZZ
nnoremap Zq ZQ

inoremap <c-a> <esc>0i
inoremap <c-e> <esc>A
inoremap <c-k> <esc>l<esc>d$<esc>A
inoremap <c-u> <esc>dd<esc>i<cr><esc>ki

inoremap ,, ,,
inoremap Zz <esc>ZZ
inoremap ZZ <esc>ZZ

inoremap Aa <esc>0i
inoremap Ee <esc>A
inoremap Kk <esc>l<esc>d$<esc>A
inoremap Uu <esc>dd<esc>i<cr><esc>ki

inoremap ö [
inoremap ä ]
inoremap Ö {
inoremap Ä }
inoremap ü \
inoremap Ü \|
inoremap ß ~

nnoremap ö [
nnoremap ä ]
nnoremap Ö {
nnoremap Ä }
nnoremap ü \
nnoremap Ü \|
nnoremap ß ~

vnoremap ö [
vnoremap ä ]
vnoremap Ö {
vnoremap Ä }
vnoremap ü \
vnoremap Ü \|
vnoremap ß ~



" restore cursor position
augroup restore_pos | au!
    au BufWinEnter *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe 'normal! g`"zz'
        \ | endif
augroup end


function! ToggleZeroBehavior()
if col('.') ==# 1
    "call feedkeys("$")
    call cursor(line('.'), col('$'))
else
    call cursor(line('.'), 1)
endif
endfunction

nnoremap <silent> 0 <esc>:call ToggleZeroBehavior()<cr>

nnoremap <silent> ll <c-w>w




