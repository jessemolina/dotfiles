" syntax	
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set nu

syntax on
filetype plugin indent on

" plugins - vim-plug
call plug#begin()

let g:plug_timeout = 300
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" plugins - NERDTree auto close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
  \ b:NERDTree.isTabTree()) | q | endif

" keybind - window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set clipboard=unnamed,unnamedplus

