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

Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'


function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --go-completer
  endif
endfunction

" Prerequisite: cmake (brew install cmake)
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}

call plug#end()

source ~/babygoat.vim
"source ~/cscope_maps.vim

nnoremap <c-n> :cnext<CR>
nnoremap <c-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" Open quickfix window automatically if vimgrep matched items exist
autocmd QuickFixCmdPost [^l]* cwindow
" Open location window automatically if lvimgrep matched items exist
autocmd QuickFixCmdPost    l* lwindow

" mapping the NERDTreeTabsToggle
map <leader>o :NERDTreeTabsToggle<CR>

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
" leader key default: '\'
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd VimEnter * if !argc() | execute 'NERDTreeTabsToggle' | endif

"YouCompleteMe options
let g:ycm_autoclose_preview_window_after_insertion = 1 " Close preview window when leaving insertion mode
let g:ycm_autoclose_preview_window_after_completion = 1 " Close preview window when accepts offer\
let g:omni_sql_no_default_maps = 1
" Use gopls instead of gocode
let g:go_def_mode = 'gopls'

if !exists("g:ycm_semantic_triggers")
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Vim-airline Theme (solarized dark)
autocmd VimEnter * if exists(":AirlineTheme") | AirlineTheme solarized | let g:airline_solarized_bg='dark' | endif

" Expand tabs in .apib(apiblueprint filetype)
au FileType conf setlocal expandtab tabstop=4 shiftwidth=4

au FileType yaml setlocal expandtab tabstop=2 shiftwidth=2

" Expand tabs in .conf(logstash filetype)
autocmd FileType logstash setlocal expandtab tabstop=4 shiftwidth=4

" Expand tab in .js, .jsx, ts filetype
au FileType javascript setlocal expandtab tabstop=2 shiftwidth=2
au FileType typescript setlocal expandtab tabstop=2 shiftwidth=2

" Expand tab in .json
au FileType json setlocal expandtab tabstop=2 shiftwidth=2

" Auto reload vimrc
autocmd bufwritepost .vimrc source $MYVIMRC
