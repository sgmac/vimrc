set encoding=UTF-8
let g:webdevicons_enable = 1

set guifont=DroidSansMono\ Nerd\ Font\ 11
colorscheme monokai
set nocompatible
set background=dark
set encoding=utf8
set showcmd
set showmode
set backspace=indent,eol,start
set backupdir=~/.vimswp
set directory=~/.vimswp

set wildmode=list:longest
set history=10000
set undolevels=10000
set scrolloff=3
set hlsearch
set incsearch
set hidden
set wildmenu
set ignorecase
set smartcase
set title
set number
set gdefault
" show vim-airline startup
set laststatus=2

filetype indent plugin on
set autoindent

nmap ss :split<Return><C-W>
nmap sv :vsplit<Return><C-W>
 

"set the runtime path to include Vundle and initialize
"set rtp+=~/.config/vim/bundle/Vundle.vim
set rtp+=~/.config/vim/autoload/plug.vim

call plug#begin("~/.config/vim/plug")

" Fish
Plug 'dag/vim-fish'

Plug 'gmarik/Vundle.vim'
Plug 'jez/vim-superman'
Plug 'qpkorr/vim-bufkill'
Plug 'mtth/scratch.vim'


" Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'

" Go programming
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'autozimu/LanguageClient-neovim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'dense-analysis/ale'

" Python
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Vimjas/vim-python-pep8-indent'

let g:python_host_prog  = '/home/sgm/.pyenv/versions/3.9.9/bin/python'


" Global
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'fholgado/minibufexpl.vim'
Plug 'mileszs/ack.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'rodjek/vim-puppet'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
"Plug 'github/copilot.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'hashivim/vim-terraform'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()            " required

let g:terraform_align=1
let g:terraform_remap_spacebar=1

autocmd FileType terraform setlocal commentstring=#%s

augroup  projectC
	autocmd BufRead,BufNewFile *.c,*.h set filetype=c
augroup end

" Coc
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-go',
\ 'coc-python',
\ 'coc-yaml',
\ 'coc-solargraph',
\ 'coc-rls',
\ 'coc-json',
\ ]

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

"use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-a>" :
      \ coc#refresh()

 inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


"" All of your Plugins must be added before the following line
syntax on
filetype plugin indent on    " required

" --- Key mapping 
imap jk <ESC>
nnoremap <space> za
vnoremap <space> zf
map      <leader>T :NERDTreeToggle<CR>

" --- Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <RIGHT><RIGHT> :cnfile<CR><C-G>
nmap <silent> <LEFT> :cprev<CR>
nmap <silent> <LEFT><LEFT> :cpfile<CR><C-G>

" --- Closing faster
let mapleader=","
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" --- Tab navigating
map <Leader>p   <esc>:bp<CR>
map <Leader>n   <esc>:bn<CR>
map <Leader>q   <esc>:bd<CR>
map <Leader>c   <esc>:tabnew<CR>

"--- Moving code blocks
vnoremap < <gv
vnoremap > >gv

" --- Sort in vistual mode
map <Leader>s :sort<CR>

 " --- Visual split of line according column=80
vmap Q  gq
vmap Q  gqap

" --- Autoreload vimrc
autocmd! bufwritepost .vimrc source %

" --- Disabling keys
nnoremap <up>   <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" --- Move faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Normal mode
nnoremap <f5> :!ctags -R<CR>
nnoremap <f3> :TlistOpen<CR>

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"
""" vim-go
"
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" highlight
let g:go_highlight_functions = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_auto_sameids = 1
let g:go_version_warning = 0
" show type info in statusbar
let g:go_auto_type_info = 1
" disable gd mapping of vim-go
let g:go_def_mapping_enabled = 0


au FileType go nmap <leader>r <Plug>(go-run %)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>tt <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

""" godoc
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

""" info
au FileType go nmap <Leader>i <Plug>(go-info)

" -- CtrlP plugin
set runtimepath^=~/.config/vim/bundle/ctrlp.vim
set wildignore+=*.pyc,*/tmp/*,*.so,*.swp,*.zip,*/vendor/*
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode =0 
let g:ctrlp_max_files=0 
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'


" -- From github.com/faith/dotfiles
let g:ctrlp_buftag_types = {
      \ 'go'     	   : '--language-force=go --golang-types=ftv',
      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
      \ }

set tags=./tags;~/Projects

" --- Better folding
set nofoldenable

" --Tagbar ctags
nmap <leader>t :TagbarToggle<CR>

" --- Tmux/Vim integration
nnoremap <silent> <ctrl-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <ctrl-j> :TmuxNavigateDown<cr>
nnoremap <silent> <ctrl-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <ctrl-l> :TmuxNavigateRight<cr>
nnoremap <silent> <ctrl-i> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1


" --- Zenroom2 plugin
nnoremap <silent> <leader>z :Goyo<cr>


" --- Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
