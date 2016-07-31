" .vimrc

set nocompatible

" Makes it easy to install plugins and runtimes
execute pathogen#infect()
call pathogen#helptags()

if &t_Co >= 256 || has("gui_running")
    colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

colorscheme mustang

syntax on
filetype plugin indent on

set pastetoggle=<F2>
                  " For paste mode for a pasting large amount of text
set number        " Line numbers
set list          " show whitespace characters
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
set tabstop=4     " a tab is four spaces
set expandtab     " insert spaces when a tab key is presses
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set shiftwidth=4  " number of spaces to use for autoindenting
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set smartindent   " smart autoindenting for C-like programs and other languages
" set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

" Search options
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set incsearch     " show search matches as you type
set hlsearch      " highlight search terms
:nmap \q :nohlsearch<CR>

" Buffer stuff
:nmap <C-e> :e#<CR>
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

" Toggle search term highlight
set hlsearch!
nnoremap <F12> :set hlsearch!<CR>

" Move cursor better with wrapped line with j,k
:nmap j gj
:nmap k gk

" toggle linenumbers
:nmap \l :setlocal number!<CR>

" alternative paste toggle
:nmap \o :set paste!<CR>

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup             " don't allow any ~, swp files
set noswapfile
