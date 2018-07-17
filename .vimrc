set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle required!
Bundle 'VundleVim/Vundle.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-dispatch'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'vim-airline/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'editorconfig/editorconfig-vim'

" colorschemes
Bundle 'morhetz/gruvbox'
Bundle 'dracula/vim'

call vundle#end()

filetype plugin indent on

let mapleader = ","

syntax enable
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set background=dark
set enc=utf-8
set mouse=a
colorscheme dracula

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
set laststatus=2    " Always show the statusline
set colorcolumn=90  " Highlight column 90 (Vim 7.3)

set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

" Resize the divisions if the Vim window size changes
au VimResized * exe "normal! \<c-w>="

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

nnoremap <silent> <c-h> :noh<CR>
nnoremap <silent> <c-j> :bn<CR>
nnoremap <silent> <c-k> :bp<CR>
nnoremap <silent> <c-l> :b#<CR>

nnoremap <silent> <leader>w :bp<CR>:bd #<CR>
nnoremap <silent> <leader>ggt :GitGutterToggle<CR>
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

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

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

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

command! JSONFormat %!python -m json.tool

nnoremap <silent><Leader>n :set invnumber<CR>
nnoremap <silent><Leader>r :set invrelativenumber<CR>
nnoremap <Leader>cc :CtrlPClearAllCaches<CR>
nnoremap <leader>f :Ag<Space>
