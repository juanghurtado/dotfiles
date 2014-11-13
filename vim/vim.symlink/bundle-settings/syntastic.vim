let g:syntastic_less_checkers = []
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_coffee_coffeelint_args = '--csv --file ~/coffeelint.json'
let g:syntastic_scss_checkers = ['']
let g:syntastic_sass_checkers = ['']
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_disabled_filetypes=['html', 'sass' , 'scss']
let g:syntastic_html_checkers=['']
