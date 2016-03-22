" Resources: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" Enable pathogen
execute pathogen#infect()

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

set background=dark
colorscheme Tomorrow-Night

set nocompatible

set modelines=0

set showcmd
set showmatch

" Searching/moving. <C-L> clears the highlightning of hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set nu

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

" Tab settings, all tabs expand to fours spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Handling long lines and show a colored column at 85 characters
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" Python settings suggested in http://docs.python-guide.org/en/latest/dev/env/
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" Easier moving code blocks. \ + > to indent forward. \ + < indents backwards
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Tests for support and enables if yes
if has('mouse')
      set mouse=a
endif

" Set GVIM font
set guifont=Consolas\ 10

" Enable Markdown syntax highligthing, by default VIM only enables it for files
" with .markdown extension.
" See: https://github.com/tpope/vim-markdown and 
autocmd BufNewFile,BufFilePre,BufRead,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['csharp=cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'html', 'python', 'bash=sh']

" Syntastic syntax checking plugin
" See: https://github.com/scrooloose/syntastic.git for requirements
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['validator', 'w3']
let g:syntastic_perl_checkers = ['podchecker']
let g:syntastic_aggregate_errors = 1
