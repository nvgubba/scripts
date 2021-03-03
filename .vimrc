set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/csapprox'
Plugin 'MattesGroeger/vim-bookmarks'
"Plugin 'bufexplorer.zip'
"Plugin 'Valloric/YouCompleteMe'
"Javascript autocomple using tern
"Plugin 'marijnh/tern_for_vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'greyblake/vim-preview'
Plugin 'suan/vim-instant-markdown'
Plugin 'TagHighlight'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'RKLogColorize'
" This seems to cause some indent issues with my JS code
"Plugin 'luochen1990/indent-detector.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Disable autocommenting
filetype plugin on
syntax on
syntax enable
au FileType * setlocal formatoptions-=cro

" Visualize tabs and spaces
set list lcs=trail:·,tab:»·

" Hightlight search string
set hlsearch

"
set ignorecase
set smartcase
"set mouse=a

" Display number and set gutter width to 4
set number
set numberwidth=4
let g:gitgutter_max_signs=10000

" Indentation
set expandtab
set shiftwidth=4
set softtabstop=4
autocmd FileType javascript setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2 textwidth=80
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"======== Start of Status and tabline configs===========
" Statusline, display always
set laststatus=2
" Don't show additional vim status line, which shows INSERT etc
set noshowmode
" Enable tab view of buffers from airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

" Show just the filename in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Force airline to use powerline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='luna'
"======== End of Status and tabline configs===========

"============Markdown===============
let g:vim_markdown_folding_disabled=1
"============Markdown===============

"======== Start of Bookmark handling =======
let g:bookmark_no_default_key_mappings=1
"let g:bookmark_save_per_working_dir = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_auto_save = 1
"let g:bookmark_highlight_lines = 1
nmap mt  :BookmarkToggle<CR>
nmap ma  :BookmarkAnnotate<CR>
nmap ms  :BookmarkShowAll<CR>
nmap mn  :BookmarkNext<CR>
nmap mp  :BookmarkPrev<CR>
nmap mc  :BookmarkClear<CR>
nmap mca :BookmarkClearAll<CR>
nmap mu  :BookmarkMoveUp<CR>
nmap md  :BookmarkMoveDown<CR>
"======== End of Bookmark handling =======

"===== Git Gutter =======
let g:gitgutter_highlight_lines = 1
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete  DiffDelete
highlight link GitGutterAddLine DiffAdd
highlight link GitGutterChangeLine DiffChange
highlight link GitGutterDeleteLine  DiffDelete
"===== Git Gutter =======

"=========Buffer switching===============
"nmap <C-Tab> :bnext<cr>
"nmap <C-S-Tab> :bprevious<cr>
nmap <F6> :bnext<cr>
nmap <S-F6> :bprevious<cr>
"=========Buffer switching===============

"==========Toggle Tag list==============
nmap <F8> :TlistToggle<CR>
let Tlist_WinWidth = 40
"==========Toggle Tag list==============

"==========NerdTree Toggle==============
map <F7> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
"==========NerdTree Toggle==============

"===CTRL-P Default Search Directory=====
let g:ctrlp_cmd='CtrlP:pwd'
"===CTRL-P Default Search Directory=====
"===CTRL-P maximum files and depth======
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
"===CTRL-P maximum files and depth======

"==========Map F5 to save===========
inoremap <F5> <c-o>:Update<CR>
"==========Map Ctrl+s to save===========

" Default vim option to enable syntax highlighting
syntax enable
" Syntastic analyzers
let g:syntastic_javascript_checkers = ['jslint']

" Ruler
"
set cursorline
set colorcolumn=80

" Disable vim preview window
set completeopt-=preview

" colorscheme desert
" 256 Color support
set t_Co=256
colorscheme PaperColor
set background=light

"====list chars colors
"====list chars colors

au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html

" ==============================
" Functions
" ==============================
" Remove trailing spaces
function! RemoveTrailingSpaces()
    exe "normal msHmtgg"
    %s/\s\+$//e
    exe "normal 'tzt`s"
endfunction

" ==============================
" Miscellaneous
" ==============================
" Remove trailing spaces when writing non-binary buffers
" au BufWrite * if ! &bin | call RemoveTrailingSpaces() | endif

"source ~/.vim/cscope_maps.vim
