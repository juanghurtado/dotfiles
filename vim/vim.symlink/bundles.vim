filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle "chriskempson/base16-vim"
NeoBundle "bling/vim-airline"
NeoBundle "MarcWeber/vim-addon-mw-utils"

" Snipmate
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "honza/vim-snippets"

filetype plugin on
filetype indent on

NeoBundleCheck
