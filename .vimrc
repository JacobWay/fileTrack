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

" auto completion
Plugin 'Valloric/YouCompleteMe'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" vim autoformat from github
Plugin 'Chiel92/vim-autoformat'
" vCoolor
Plugin 'KabbAmine/vCoolor.vim'
" block comment
Plugin 'scrooloose/nerdcommenter'
" syntastic check
Plugin 'scrooloose/syntastic'
" All of your Plugins must be added before the following line
call vundle#end()   "required
filetype plugin indent on

execute pathogen#infect()


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

" Navigation
set number
set mouse=a
set mousehide
set hlsearch

" Normal Mode Key Bindings
nnoremap <C-k>  <C-w>k  " Move along windows faster
nnoremap <C-j>  <C-w>j  " Move along windows faster
nnoremap <C-h>  <C-w>h  " Move along windows faster
nnoremap <C-l>  <C-w>l  " Move along windows faster

nnoremap <C-tab>    :tabnext<CR>
nnoremap <C-t>  :tabnew<CR>

" Line movement
" nnoremap j  gj  " Move along rows, not lines
" nnoremap k  gk  " Move along rows, not lines
" nnoremap 0  g0  " Move along rows, not lines
" nnoremap $  g$  " Useful for long lines

autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

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

autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" mapleader
let mapleader = ","

" vim-autoformat folders containing formatters
let g:autoformat_verbosemode=1
let verbose=1
" let g:formatterpath = ['/usr/local/bin/html-beautify']

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" YouCompleteMe config
let g:ycm_python_binary_path = 'python3'
