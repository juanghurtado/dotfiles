set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=1
set cursorline
set encoding=utf-8
set formatoptions+=n
set formatoptions=qrn1
set gcr=a:blinkon0
set gdefault
set hidden
set history=1000
set hlsearch
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
set number
set ruler
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set so=10
set softtabstop=2
set tabstop=2
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

" vim-airline
let g:airline_powerline_fonts=1

" base16-vim
let base16colorspace=256
colorscheme base16-default

" Unite.vim
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <leader>t :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
