filetype plugin on
filetype indent on

" --- display ---

" long line (larger than window)
set wrap

set ruler
set number

" identation space round
set shiftround

" --- edit ---

" configure backspace to act properly in vim
set backspace=eol,start,indent

" map copy(ctrl+c), paste(ctrl+v) to system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

