set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-ragtag'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on

let mapleader = ","

syntax enable
set background=dark
" let g:solarized_termcolors=256
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
colorscheme solarized

highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=green

set autoindent
set nowrap
set hidden
set hlsearch
set spell
set modeline
set expandtab
set textwidth=0
set tabstop=8
set softtabstop=4
set shiftwidth=4
set tags=tags,/home/mcordial/pyenvs/asurepo/lib/python2.7/site-packages/tags,/home/mcordial/pyenvs/src/tags
set wildignore+=*.o,*.obj,.git,*.pyc,*.egg-info,*.vim,/home/mcordial/repo/asurepo/static/**
set backupdir=~/.vim/sessions//
set directory=~/.vim/sessions//
set pastetoggle=<leader>p
set backspace=indent,eol,start
set encoding=utf-8
set laststatus=2   " Always show the statusline
set colorcolumn=80  " Highlight characters extending past column 80 (Vim 7.3)
" match ErrorMsg '\%>80v.\+'  " Highlight characters extending past column 80 (Vim < 7.3)

nmap <silent> <c-h> :noh<CR>
nmap <silent> <c-j> :bn<CR>
nmap <silent> <c-k> :bp<CR>
nmap <silent> <c-l> :b#<CR>
nmap <silent> <leader>c :bp<CR>:bd #<CR>
nmap <silent> <leader>t :TagbarToggle<CR>
nmap <leader>s :Gstatus<CR>
nmap <c-b> :CtrlPBuffer<CR>
nmap <silent> <c-c> :CtrlPClearAllCaches<CR>

" let the command-line act like a shell with emacs bindings
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType rst set tw=80
autocmd FileType yaml set sw=2 expandtab softtabstop=2
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace
au BufNewFile,BufReadPost *.coffee,Cakefile,*.eco setl shiftwidth=2 expandtab softtabstop=2

" let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
