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

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Same indentation movement
onoremap ii :<c-u>call <SID>IndentTextObject()<cr>
onoremap аi :<c-u>call <SID>IndentTextObject()<cr>
xnoremap ii :<c-u>call <SID>IndentTextObject()<cr>
xnoremap ai :<c-u>call <SID>IndentTextObject()<cr>

" CoffeeScript function movement
onoremap if :<c-u>call <SID>FunctionTextObject('i')<cr>
onoremap аf :<c-u>call <SID>FunctionTextObject('a')<cr>
xnoremap if :<c-u>call <SID>FunctionTextObject('i')<cr>
xnoremap af :<c-u>call <SID>FunctionTextObject('a')<cr>
