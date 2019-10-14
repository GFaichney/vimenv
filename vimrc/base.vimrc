set number
set nowrap
syntax enable
set clipboard=unnamed

set nocompatible
filetype off 
filetype plugin indent on

" === Indent Settings
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" === Spelling
set spell

" === Search Options
set incsearch
set hlsearch

" === Allow hiding of modified buffers
set hidden

" === Custom file types
au BufRead,BufNewFile Jenkinsfile setfiletype groovy
au BufRead,BufNewFile Dockerfile* setfiletype dockerfile

" === Fix Backspace
set backspace=indent,eol,start

" === Highlight line under cursor
set cursorline

" === Paste mode toggle
set pastetoggle=<F2>

" === Spelling toggle
nmap <F3> :set spell!<CR>

set packpath+=~/.vim/pack/

" === NERDTree settings
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Enable Powerline fonts
let g:airline_powerline_fonts = 1
