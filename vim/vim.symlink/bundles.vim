filetype off

if has("vim_starting")
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand("~/.vim/bundle/"))

NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle "chriskempson/base16-vim"
NeoBundle "bling/vim-airline"
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "dahu/LearnVim"
NeoBundle "Shougo/unite.vim"
NeoBundle "cakebaker/scss-syntax.vim"
NeoBundle "pangloss/vim-javascript"
NeoBundle "tpope/vim-surround"
NeoBundle "tomtom/tcomment_vim"
NeoBundle "tpope/vim-markdown"
NeoBundle "Shougo/vimproc", {
			\ "build" : {
			\     "windows" : "make -f make_mingw32.mak",
			\     "cygwin" : "make -f make_cygwin.mak",
			\     "mac" : "make -f make_mac.mak",
			\     "unix" : "make -f make_unix.mak",
			\    },
			\ }

" Snipmate
NeoBundle "tomtom/tlib_vim"
NeoBundle "garbas/vim-snipmate"
NeoBundle "honza/vim-snippets"

filetype plugin on
filetype indent on

NeoBundleCheck
