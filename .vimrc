set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-vinegar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'kien/ctrlp.vim'
Bundle 'othree/html5.vim'
Bundle 'mattn/emmet-vim'
Bundle 'delimitMate.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'rking/ag.vim'

filetype plugin indent on

let mapleader = ","

syntax enable
set background=dark
" let g:solarized_termcolors=256
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set enc=utf-8
colorscheme solarized

highlight clear SignColumn
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=green

set autoindent
set nowrap
set hidden
set spell
set modeline
set cursorline
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all
set expandtab
set splitbelow
set splitright
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set tags=tags,/home/mcordial/pyenvs/asurepo/lib/python2.7/site-packages/tags,/home/mcordial/pyenvs/src/tags
set nofoldenable

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options
set wildignore+=*.o,*.obj,.git,*.pyc,*.egg-info,*.vim,/home/mcordial/repo/asurepo/static/**
set wildignore+=*.pyc,*.egg-info,*.vim
set wildignore+=/home/mcordial/repo/asurepo/static/**,.idea

set backupdir=~/.vim/sessions//
set directory=~/.vim/sessions//
set backspace=indent,eol,start
set encoding=utf-8
set showcmd         " display incomplete commands
set laststatus=2    " Always show the statusline
set colorcolumn=80  " Highlight characters extending past column 80 (Vim 7.3)
" match ErrorMsg '\%>80v.\+'  " Highlight characters extending past column 80 (Vim < 7.3)

set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

" Resize the divisions if the Vim window size changes
au VimResized * exe "normal! \<c-w>="

nnoremap <silent> <c-h> :noh<CR>
nnoremap <silent> <c-j> :bn<CR>
nnoremap <silent> <c-k> :bp<CR>
nnoremap <silent> <c-l> :b#<CR>

nnoremap <silent> <leader>w :bp<CR>:bd #<CR>
nnoremap <silent> <leader>ggt :GitGutterToggle<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <leader>p :set invpaste<CR>

" let the command-line act like a shell with emacs bindings
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>

" Autoload configuration when this file changes ($MYVIMRC)
autocmd! BufWritePost .vimrc source %
au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace
au BufNewFile,BufReadPost *.coffee,Cakefile,*.eco setl shiftwidth=2 expandtab softtabstop=2

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

let delimitMate_expand_space = 1

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>go :Gread<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gB :Gbrowse<CR>
nnoremap <leader>gp :Git! push<CR>
nnoremap <leader>gP :Git! pull<CR>
nnoremap <leader>gi :Git!<Space>

" for the diffmode
noremap <leader>du :diffupdate<CR>

let g:ctrlp_extensions = ['tag']

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nnoremap <silent><Leader>n :set invnumber<CR>
nnoremap <silent><Leader>r :set invrelativenumber<CR>
nnoremap <Leader>cc :CtrlPClearAllCaches<CR>

let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1

source ~/.vimrc-local
