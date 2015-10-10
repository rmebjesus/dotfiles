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
set visualbell
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
