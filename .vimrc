call plug#begin()
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

set rnu
set nu
syntax on

set backspace=indent,eol,start
set autoindent expandtab tabstop=2 shiftwidth=2 ":retab (ggf.)
set softtabstop=2 
set shiftround 

set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set encoding=utf8
set hlsearch ignorecase incsearch smartcase
set lazyredraw
set cursorline
set ttyfast

set showmode
set ruler
set rulerformat=%(buf:%n\ col:%c%)
set laststatus=0 
set showtabline=0

set wrap
set linebreak
set scrolloff=3
set showcmd
set showmatch

set wildmenu wildmode=longest:full,full wildcharm=<Tab>


inoremap <c-a> <esc>0i
inoremap <c-e> <esc>A
inoremap <c-k> <esc>l<esc>d$<esc>A
inoremap <c-u> <esc>dd<esc>i<cr><esc>ki

inoremap ,, ,,

inoremap Aa <esc>0i
inoremap Ee <esc>A
inoremap Kk <esc>l<esc>d$<esc>A
inoremap Uu <esc>dd<esc>i<cr><esc>ki

nnoremap <silent> ll <c-w>w

inoremap <silent> jj <esc>

inoremap <silent> ZZ <esc>ZZ
inoremap <silent> Zz <esc>ZZ
nnoremap <silent> Zz ZZ
inoremap <silent> Zq <esc>ZQ
inoremap <silent> ZQ <esc>ZQ
nnoremap <silent> Zq ZQ
nnoremap <silent> qq <esc>:cq 1<cr>
nnoremap <silent> Qq <esc>:cq 1<cr>
nnoremap <silent> QQ <esc>:cq 1<cr>

inoremap ö [
inoremap ä ]
inoremap Ö {
inoremap Ä }
inoremap ü \
inoremap Ü \|
inoremap ß @

nnoremap ö [
nnoremap ä ]
nnoremap Ö {
nnoremap Ä }
nnoremap ü \
nnoremap Ü \|
nnoremap ß @

vnoremap ö [
vnoremap ä ]
vnoremap Ö {
vnoremap Ä }
vnoremap ü \
vnoremap Ü \|
vnoremap ß @



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



