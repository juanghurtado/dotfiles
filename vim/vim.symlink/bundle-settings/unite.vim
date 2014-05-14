let g:unite_enable_start_insert = 1
let g:unite_split_rule = 'botright'
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 10000

if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--noheading --nocolor'
	let g:unite_source_grep_recursive_opt=''
	let g:unite_source_rec_async_command="ag --nocolor --nogroup --ignore '.hg' --ignore '.svn' --ignore '.git' --ignore '.bzr' --hidden -g ''"
endif

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
	imap <buffer> <C-c>   <Plug>(unite_redraw)
	imap <silent><buffer><expr> <C-x> unite#do_action('split')
	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

	nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <silent> <leader>t :<C-u>Unite file_rec/async:!<CR><CR>
nnoremap <leader>b :<C-u>Unite buffer<CR>
nnoremap <leader>y :<C-u>Unite history/yank<CR>
