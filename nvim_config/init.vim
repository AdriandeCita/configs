set clipboard+=unnamedplus
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" Custom plugins...
" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
Plugin 'easymotion/vim-easymotion'
" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Neomake build tool (mapped below to <c-b>)
Plugin 'benekastah/neomake'
" Remove extraneous whitespace when edit mode is exited
Plugin 'thirtythreeforty/lessspace.vim'
" Tree view
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Jade/pug support
Plugin 'digitaltoad/vim-pug'
" emmet copletion
Plugin 'mattn/emmet-vim'
" Color scheme
Plugin 'kristijanhusak/vim-hybrid-material'
" JSON support
Plugin 'elzr/vim-json'
" Html5 support
Plugin 'othree/html5.vim'
" JS support
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
" PHP support
Plugin 'StanAngeloff/php.vim'
" Scss support
Plugin 'cakebaker/scss-syntax.vim'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
" Autoformatter
Plugin 'Chiel92/vim-autoformat'
" Line swapper
Plugin 'AdriandeCita/vim-swap-lines'
" Status bar mods
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
" Tab completion
Plugin 'ervandew/supertab'


" After all plugins...
call vundle#end()
filetype plugin indent on

""""""" Jedi-VIM """""""
" Don't mess up undo history
let g:jedi#show_call_signatures = "0"


""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

"call SuperTabChain(Completefunc, '<c-n>')

"let g:SuperTabCompletionContexts = ['g:ContextText2']


""""""" General coding stuff """""""

"Set 256 colors
set t_Co=256
"change the terminal's title
set title
"Line numbers are good
set number
"Store lots of :cmdline history
set history=500
"Show incomplete cmds down the bottom
set showcmd
"Hide showmode because of the powerline plugin
set noshowmode
"Set global flag for search and replace
set gdefault
"Set cursor blinking rate
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set gcr=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=200                                             "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
"set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
"set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set completeopt-=preview                                                        "Disable preview for autocomplete
set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new splits positions
set shiftwidth=4  " operation >> indents 2 columns; << unindents 2 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 2 spaces when hitting a TAB/BACKSPACE

set listchars=tab:!▸,trail:·,nbsp:-
set list
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

syntax on                                                                       "turn on syntax highlighting
"transparent bg
hi Normal ctermbg=none

colorscheme hybrid_material

""""""" Keybindings """""""
" Set up leaders
let mapleader="/"
let maplocalleader="\\"

" Linux / windows ctrl+backspace ctrl+delete
" Note that ctrl+backspace doesn't work in Linux, so ctrl+\ is also available
imap <C-backspace> ú
imap <C-\> ú
imap <C-delete> ø

map <C-l> :tabn<cr>
map <C-h> :tabp<cr>
map <C-n> :tabnew<cr>
map <C-a> :NERDTreeToggle<cr>

set rtp+=~/.config/nvim/bundle/Vundle.vim

" Neomake and other build commands (ctrl-b)
nnoremap <C-b> :w<cr>:Neomake<cr>

autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>
