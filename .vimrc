set nocompatible
filetype off

call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'doums/darcula'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'
call plug#end()

filetype plugin indent on

let mapleader = ","

if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

syntax enable
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set viminfo='20,<1000,s1000
set enc=utf-8
set mouse=a
set clipboard=unnamed
set background=dark
colorscheme night-owl
let g:lightline = { 'colorscheme': 'nightowl' }

highlight clear SignColumn
highlight clear SpellBad
highlight SpellBad cterm=underline "ctermfg=green

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
set tags=tags
set nofoldenable

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options
set wildignore+=*.o,*.obj,.git,*.vim
set wildignore+=*.pyc,*.egg-info/*,*.egg/**

set backupdir=~/.vim/sessions//
set directory=~/.vim/sessions//
set backspace=indent,eol,start
set encoding=utf-8
set showcmd         " display incomplete commands
set laststatus=2    " always show statusline for lightline
set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

" Resize the divisions if the Vim window size changes
au VimResized * exe "normal! \<c-w>="

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

map <C-n> :NERDTreeToggle<CR>

nnoremap <silent> <c-h> :noh<CR>
nnoremap <silent> <c-j> :bn<CR>
nnoremap <silent> <c-k> :bp<CR>
nnoremap <silent> <c-l> :b#<CR>
nnoremap <silent> <leader>w :bp<CR>:bd #<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>p :set invpaste<CR>

" let the command-line act like a shell with emacs bindings
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>

" Autoload configuration when this file changes ($MYVIMRC)
autocmd! BufWritePost .vimrc source %

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
command! JSONFormat %!python -m json.tool

nnoremap <silent><Leader>n :set invnumber<CR>
nnoremap <silent><Leader>r :set invrelativenumber<CR>
nnoremap <Leader>cc :CtrlPClearAllCaches<CR>
nnoremap <leader>f :Rg<Space>
nnoremap <c-p> :Files<CR>

