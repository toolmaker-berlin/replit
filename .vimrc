call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()


set rnu
syntax on
set backspace=indent,eol,start

nnoremap Zz ZZ
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

nnoremap ö [
nnoremap ä ]
nnoremap Ö {
nnoremap Ä }
nnoremap ü \
nnoremap Ü \|

vnoremap ö [
vnoremap ä ]
vnoremap Ö {
vnoremap Ä }
vnoremap ü \
vnoremap Ü \|



