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
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

