filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

let mapleader = ","

syntax on
colorscheme jellybeans

highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=green 

set nocompatible
set autoindent
set nowrap
set hidden
set hlsearch
set spell
set modelines=0
set expandtab
set textwidth=0
set tabstop=8
set softtabstop=4
set shiftwidth=4
set tags=tags,/home/mcordial/pyenvs/asurepo/lib/python2.7/site-packages/tags,/home/mcordial/pyenvs/src/tags
set wildignore+=*.o,*.obj,.git,*.pyc,*.egg-info,*.vim,/home/mcordial/repo/asurepo/static/**
set backupdir=~/.vim/sessions//
set directory=~/.vim/sessions//
set pastetoggle=<F2>
set backspace=indent,eol,start

nmap <silent> <c-h> :noh<CR>
nmap <silent> <c-j> :bn<CR>
nmap <silent> <c-k> :bp<CR>
nmap <silent> <c-l> :b#<CR>
nmap <silent> <leader>c :bp<CR>:bd #<CR>
nmap <leader>s :Gstatus<CR>
nmap <leader>b :LustyJuggler<CR>

autocmd FileType html set ft=htmldjango.html " For SnipMate
au BufNewFile,BufReadPost *.coffee,Cakefile,*.eco setl shiftwidth=2 expandtab softtabstop=2

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

