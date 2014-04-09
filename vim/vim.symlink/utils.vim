" vim:fdm=marker

" Indent Utils {{{

function! s:UpperIndentLimit(lineno)
  let base_indent  = indent(a:lineno)
  let current_line = a:lineno
  let prev_line    = prevnonblank(current_line - 1)

  while current_line > 0 && indent(prev_line) >= base_indent
    let current_line = prev_line
    let prev_line    = prevnonblank(current_line - 1)
  endwhile

  return current_line
endfunction

function! s:LowerIndentLimit(lineno)
  let base_indent  = indent(a:lineno)
  let current_line = a:lineno
  let next_line    = nextnonblank(current_line + 1)

  while current_line < line('$') && indent(next_line) >= base_indent
    let current_line = next_line
    let next_line    = nextnonblank(current_line + 1)
  endwhile

  return current_line
endfunction

" }}}
" Indent functions {{{

function! IndentTextObject()
  let upper = s:UpperIndentLimit(line('.'))
  let lower = s:LowerIndentLimit(line('.'))

  if lower > upper
    exe upper
    exe 'normal! V'.(lower - upper).'j'
  else
    normal! V
  endif
endfunction

function! FunctionTextObject(type)
  let function_start = search('\((.\{-})\)\=\s*[-=]>$', 'Wbnc')
  if function_start <= 0
    return
  endif

  let body_start = function_start + 1
  " TODO (2012-03-31) if indent(body_start) == indent(function_start)
  let indent_limit   = s:LowerIndentLimit(body_start)

  if a:type == 'i'
    let start = body_start
  else
    let start = function_start
  endif

  if indent_limit > start
    exe start
    exe 'normal! V'.(indent_limit - start).'j'
  else
    exe 'normal! V'
  endif
endfunction

" }}}
