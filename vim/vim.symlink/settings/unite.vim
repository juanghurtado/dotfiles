let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
	imap <silent><buffer><expr> <C-x> unite#do_action('split')
	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

	nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 5)

nnoremap <leader>t :<C-u>Unite file_rec<CR>
nnoremap <leader>b :<C-u>Unite buffer<CR>
