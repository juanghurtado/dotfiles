" Toggle Search Highlight
nmap <leader>h :set hls! <cr>

" Toggle Paste Mode
nmap <leader>p :set paste! <cr>

" Sane up and down
nnoremap j gj
nnoremap k gk

" F1 = ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Clean whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Same indentation movement
onoremap ii :<c-u>call IndentTextObject()<cr>
onoremap аi :<c-u>call IndentTextObject()<cr>
xnoremap ii :<c-u>call IndentTextObject()<cr>
xnoremap ai :<c-u>call IndentTextObject()<cr>

" CoffeeScript function movement
onoremap if :<c-u>call FunctionTextObject('i')<cr>
onoremap аf :<c-u>call FunctionTextObject('a')<cr>
xnoremap if :<c-u>call FunctionTextObject('i')<cr>
xnoremap af :<c-u>call FunctionTextObject('a')<cr>
