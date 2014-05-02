" vim:fdm=marker

" Global {{{

" Sane up and down
nnoremap j gj
nnoremap k gk

" Clean whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Same indentation movement
onoremap ii :<c-u>call IndentTextObject()<cr>
xnoremap ii :<c-u>call IndentTextObject()<cr>

xnoremap ai :<c-u>call IndentTextObject()<cr>
onoremap аi :<c-u>call IndentTextObject()<cr>

" Paste Mode
nmap <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" }}}
" Toggles {{{

" Search Highlight
nmap <leader>h :set hls! <cr>

" }}}
" CoffeeScript {{{

" Function movement
onoremap if :<c-u>call FunctionTextObject('i')<cr>
xnoremap if :<c-u>call FunctionTextObject('i')<cr>

xnoremap af :<c-u>call FunctionTextObject('a')<cr>
onoremap аf :<c-u>call FunctionTextObject('a')<cr>

" Compile CoffeeScript on current buffer or selection and show
" resulting Javascript on a new buffer
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

" }}}
