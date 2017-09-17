set nocompatible    " be iMproved, required
filetype off    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" expanding abbreviations similar to emmet
Plugin 'mattn/emmet-vim'

" auto completion
Plugin 'Valloric/YouCompleteMe'
" git gateway plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" vim autoformat from github
Plugin 'Chiel92/vim-autoformat'
" simple color selector of vCoolor
Plugin 'KabbAmine/vCoolor.vim'
" block comment
Plugin 'scrooloose/nerdcommenter'
" syntastic check
" Plugin 'scrooloose/syntastic'
" All of your Plugins must be added before the following line

" fuzzy file, buffer, mru, tag, etc finder
Plugin 'ctrlpvim/ctrlp.vim'

" powerline vim
Plugin 'vim-airline/vim-airline'

" react, jsx
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" es6 syntax
Plugin 'othree/yajs.vim'
Plugin 'maxmellon/vim-jsx-pretty'

" vim syntastic
Plugin 'vim-syntastic/syntastic'

" eslint fix
Plugin 'ruanyl/vim-fixmyjs'

" vim jsbeautify
Plugin 'maksimr/vim-jsbeautify'

Plugin 'millermedeiros/vim-esformatter'

" vim-vue syntax
Plugin 'posva/vim-vue'

" vim-misc
Plugin 'xolox/vim-misc'

" automated tag generation and syntax highlighting in vim
Plugin 'xolox/vim-easytags'

" an overview of the structure of source code
Plugin 'vim-scripts/taglist.vim'

call vundle#end()   "required
filetype plugin indent on

execute pathogen#infect()


" General setting
"
" Filetype Syntax
syntax on
filetype plugin indent on
filetype plugin on

" Tabs
set autoindent
set modeline
set expandtab
set shiftwidth=4
set softtabstop=4

" Mouse and appearance
set mouse=a
set mousehide
set number
set hlsearch

"Window
" Normal Mode Key Bindings
nnoremap <C-k>  <C-w>k  " Move along windows faster
nnoremap <C-j>  <C-w>j  " Move along windows faster
nnoremap <C-h>  <C-w>h  " Move along windows faster
nnoremap <C-l>  <C-w>l  " Move along windows faster

" Line movement
" nnoremap j  gj  " Move along rows, not lines
" nnoremap k  gk  " Move along rows, not lines
" nnoremap 0  g0  " Move along rows, not lines
" nnoremap $  g$  " Useful for long lines

syntax enable
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized


nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>


if bufwinnr(1)
  map + <C-W>+
  map _ <C-W>-
  map = <C-W>>
  map - <C-W><
endif


" vim-thematic
let g:thematic#themes = {
\ 'bubblegum'  : {
\                },
\ 'jellybeans' : { 'laststatus': 0,
\                  'ruler': 1,
\                },
\ 'pencil_dark' :{'colorscheme': 'pencil',
\                 'background': 'dark',
\                 'airline-theme': 'badwolf',
\                 'ruler': 1,
\                },
\ 'pencil_lite' :{'colorscheme': 'pencil',
\                 'background': 'light',
\                 'airline-theme': 'light',
\                 'ruler': 1,
\                },
\ }


let g:thematic#defaults = {
\ 'airline-theme': 'jellybeans',
\ 'background': 'dark',
\ 'laststatus': 2,
\ }

" Plugins
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" mapleader
let mapleader = ","

" vim-autoformat folders containing formatters
let g:autoformat_verbosemode=1
let verbose=1
let g:formatterpath = [ '/usr/local/bin/js-beautify', '/usr/local/bin/html-beautify', '/usr/local/bin/css-beautify']
noremap <F3> :Autoformat<CR>

" YouCompleteMe go to definition
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>

set tags=./tags;


" compile java
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <Leader>r :make<Return>:copen<Return>


" search only over a visual range
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a     " on OSX press ALT and click
set bs=2    " make backspace behave like normal again

" Rebind <leader> key
let mapleader=","

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
" ? can't work
noremap <C-s> :w<CR>
vnoremap <C-s> <C-c> :update<CR>
inoremap <C-s> <C-o>:update<CR>


" Quick quit command
noremap <leader>e :quit<CR> " Quit current window
noremap <leader>E :qa!<CR>  " Quit all windows

" bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
nnoremap <C-tab>    :tabnext<CR>
nnoremap <C-t>  :tabnew<CR>
map <leader>n :tabprevious<CR>
map <leader>m :tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Color scheme
" ? how does it work
"set t_Co=256
"color wombat256mod

" Disable stupid backup and swap files - they trigger too many eventes
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" utf-8 support
set encoding=utf-8

" virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))

EOF

" python syntax checking/highlighting
let python_highlight_all=1


" scrooloose/syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" YouCompleteMe config
let g:ycm_python_binary_path = 'python3'


" open all folds
set foldlevel=99

" move to previous window
nmap <Leader>p :<c-w><c-p>

" toggle nerdtree
nmap <Leader>a :NERDTreeToggle<cr>

" autoreflesh nerdtree
"autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p


" reload all buffer
nmap <leader>z :bufdo e<cr>


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom, order:ttb, min:1, max:10, results:10'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_reuse_window = 'netrw'
let g:ctrlp_tabpage_position = 'ac'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
map ff :CtrlP<.><cr>


" powerline vim setup
let g:airline_powerline_fonts = 1

" react jsx
let g:jsx_ext_required = 0

" change line
map <leader>i <ESC>i<CR><ESC>


""""""""""""""""""""""""""""""
" Plugins setup
""""""""""""""""""""""""""""""

" vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" eslint fixmyjs
let g:fixmyjs_rc_filename = '.eslintrc.js'
noremap <Leader>f :Fixmyjs<CR>

" will run esformatter after pressing <leader> followed by the 'e' and 's' keys
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

"vim-jsx-pretty
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 0


"
" General Rules
"

" Searching with smart case
set ignorecase
set smartcase

" jump from, eg, a <div> to its </div>
runtime macros/matchit.vim


" jsbeautify
map <leader>b :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <leader>b :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <leader>b :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <leader>b :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <leader>b :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <leader>b :call CSSBeautify()<cr>


" vue file syntax highlight
" au BufReadPost *.vue set syntax=html


" set html file tab convert to spaces
autocmd FileType html setlocal shiftwidth=4 softtabstop=4 expandtab

" set js file tab convert to spaces
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 expandtab

" posva/vim-vue syntax highlighting stops working randomly
autocmd FileType vue syntax sync fromstart

" vim-taglist set
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
