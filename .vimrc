" babygoat's vim config
" ====================

call plug#begin('~/.vim/plugged/')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()

source ~/babygoat.vim
source ~/cscope_maps.vim

map <c-n> :cnext<CR>
map <c-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" mapping the NERDTreeTabsToggle
map <c-o> :NERDTreeTabsToggle<CR>

" Enable Mouse
set mouse=a
let g:NERDTreeMouseMode=3

" GO syntax highlighter
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" GO Shortcut
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" GOTag
let g:tagbar_type_go = {  
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }  

autocmd VimEnter * if !argc() | execute 'NERDTreeTabsToggle' | endif

" Vim-airline Theme(solarized dark)
autocmd VimEnter * if exists(":AirlineTheme") | AirlineTheme solarized | let g:airline_solarized_bg='dark' | endif