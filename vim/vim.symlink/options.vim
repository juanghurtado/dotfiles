set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=1
set clipboard+=unnamed
set cursorline
set encoding=utf-8
set gcr=a:blinkon0
set gdefault
set hidden
set history=1000
set nohlsearch
set ignorecase
set iskeyword-=_
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬
set mat=5
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nowb
set relativenumber
set number
set ruler
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set shiftround
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set so=10
set textwidth=80
set t_Co=256
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set undofile
set virtualedit=block
set visualbell
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Tabs
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

" base16-vim
let base16colorspace=256
colorscheme base16-default

" Trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Create SilverSearcher :Ag command
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" SCSS Filetype for .scss and .sass extensions
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd BufNewFile,BufRead *.sass set filetype=sass

" Coffee Compile and go to linenumber => :C<number>
command! -nargs=1 C CoffeeCompile | :<args>
