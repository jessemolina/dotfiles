" Vim Configuration
" Minimal base configuration matching core Neovim settings

" Leader key (must be set before any leader mappings)
let mapleader = " "
let maplocalleader = " "

" Essential Settings
set nocompatible              " Use Vim defaults (not Vi)
filetype plugin indent on     " Enable filetype detection and plugins
syntax enable                 " Enable syntax highlighting

" Line numbers
set number                    " Show absolute line numbers
set relativenumber           " Show relative line numbers

" Mouse support
set mouse=a                   " Enable mouse in all modes

" Clipboard
set clipboard=unnamedplus     " Use system clipboard

" Search
set ignorecase               " Case insensitive search
set smartcase                " Unless uppercase is used
set hlsearch                 " Highlight search results
set incsearch                " Show matches while typing

" Indentation
set expandtab                " Use spaces instead of tabs
set tabstop=4                " Tab width
set shiftwidth=4             " Indent width
set smartindent              " Auto indent new lines

" UI
set cursorline               " Highlight current line
set scrolloff=10             " Keep 10 lines visible above/below cursor
set signcolumn=yes           " Always show sign column
set showmode                 " Show current mode (INSERT, VISUAL, etc.)
set ruler                    " Show cursor position in status line
set cmdheight=2              " More space for displaying messages
set laststatus=2             " Always show status line
set showcmd                  " Show partial commands as you type them

" Splits
set splitright               " Open vertical splits to the right
set splitbelow               " Open horizontal splits below

" Files
set hidden                   " Allow hidden buffers
set autoread                 " Auto reload changed files
set undofile                 " Persistent undo
set undodir=~/.vim/undodir   " Undo directory

" Performance
set updatetime=250           " Faster completion
set timeoutlen=1000          " Leader key timeout (1 second)

" Create undo directory if it doesn't exist
if !isdirectory(expand('~/.vim/undodir'))
    call mkdir(expand('~/.vim/undodir'), 'p')
endif

" Basic key mappings
" Clear search highlight (only in normal mode, don't interfere with INSERT mode)
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Leader key mappings are now in ~/.vim/plugin/keys.vim