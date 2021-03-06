" Settings for vundle pacakge manager
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
" Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'epmatsw/ag.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End vundle settings


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Change the default copy and paste register to the system register
if has("unnamedplus")
  set clipboard=unnamedplus
endif " has("unnamedplus")

" Set leader to space
let mapleader = ","

" Enable line numbering
set nu

" Set tab to 4 spaces
" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" end Set tab to 4 spaces

" Open split planes in a more natural way
set splitbelow
set splitright

" Split navigation mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Searching and replacing mapping
nnoremap <Leader>h :%s/<C-r><C-w>/
nnoremap <Leader>f :Ag! <C-r><C-w>
nnoremap <Leader>n :AgFile!<Space>

" Set encoding to utf-8
set encoding=utf-8

" Configureing You Complete Me
let g:ycm_autoclose_preview_window_after_completion=1 
map <Leader>d  :YcmCompleter GoToDefinitionElseDeclaration <CR>
map <Leader>b  :YcmCompleter GoToReferences <CR>
map <Leader>q  :YcmCompleter GetDoc <CR>


" Color Scheme
colorscheme zenburn

" Show current branch in a git repo
" let gitoutput = split(system('git status --porcelain -b '.shellescape(expand('%')).' 2>/dev/null'),'\n')
" if len(gitoutput) > 0
"     let gitstatus = systemlist("git branch | sed -n '/\* /s///p'")[0]
" else
"     let gitstatus = 'not a git repo'
" endif
" 
" let g:airline_section_b = '%{gitstatus}'

" Startkit for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python3', 'flake8', 'mypy']

" Configure nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Python specific mappings and commands.
au BufReadPost,BufNewFile *.py set colorcolumn=120 
    \ | highlight ColorColumn ctermbg=0 guibg=lightgrey 
    \ | noremap <Leader>l :Black<CR>
