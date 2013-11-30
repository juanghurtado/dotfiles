filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "chriskempson/base16-vim"
Bundle "bling/vim-airline"
Bundle "MarcWeber/vim-addon-mw-utils"

" Snipmate
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

filetype plugin on
filetype indent on
