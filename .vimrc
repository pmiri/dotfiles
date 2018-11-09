set nocompatible
set magic
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent smartindent
set showmode
set backspace=indent,eol,start
syntax on
set ruler
set cc=80
highlight ColorColumn ctermbg=2
inoremap jj <Esc>
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ============================
" PLUGINS
" ============================

"NERDTREE
" opens file tree in new left pane, shortcut: F7 (see remap section)
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

"NERD COMMENTER
" to comment: <leader>cc
" uncomment : <leader>cu
Plugin 'scrooloose/nerdcommenter'

" SOLARIZED THEME
" You need this for kickass solarized theme (see options section)
Plugin 'altercation/vim-colors-solarized'

" FIXWHITESPACE
" Get rid of white spaces
" usage: :FixWhitespace
Plugin 'bronson/vim-trailing-whitespace'

" TABULAR
" align stuff easily!
" See the screen cast on gihub for quick tutorial.
" See shortcut below
Plugin 'godlygeek/tabular'

" EASY MOTION
Plugin 'easymotion/vim-easymotion'

" INCSEARCH
" incremental, fuzzy, search with easymotion integration
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'

Plugin 'tomasr/molokai'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ============================
" PLUGIN OPTIONS
" ============================

" SOLARIZED
" set background=dark
"" " config for proper displaying of colors in Screen
"let g:solarized_termcolors=256
"se t_Co=256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
" colorscheme solarized
"let g:molokai_original=1
"let g:rehash256=1
"colorscheme molokai
colorscheme default
" EASYMOTION
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)

" Easymotion, Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)

" Easymotion, Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

" Auto turn-off highlight after search
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ============================
" KEY REMAP
" ============================

" NERDTREE
nmap <F7> :NERDTreeToggle<CR>

" TABULAR
" Tabularize shortcut in normal or visual mode
map tt :Tabularize /


" ============================
" FUNCTIONS
" ============================

" COPY TO CLIPBOARD (custom function)
" Sends everything in buffer to clipboard, requires xclip installed in your linux
command! Clip w !xclip -i -sel clip

" INCSEARCH
" required for Incsearch to work well
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" Easymotion + Incsearch/ fuzzy word
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
highlight Comment cterm=italic



