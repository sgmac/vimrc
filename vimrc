set encoding=UTF-8

" This requires to install Hack Nerd Fonts
let g:webdevicons_enable = 1

set nocompatible
colorscheme  badwolf
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

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Tim Pope
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'

" Go programming
Plugin 'fatih/vim-go'
Plugin 'neoclide/coc.nvim'
Plugin 'ryanoasis/vim-devicons'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'dense-analysis/ale'

" Python
Plugin 'Xuyuanp/nerdtree-git-plugin'

" General
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'mileszs/ack.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chase/vim-ansible-yaml'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'

" Terraform
Plugin 'hashivim/vim-terraform'
let g:terraform_align=1
let g:terraform_remap_spacebar=1
autocmd FileType terraform setlocal commentstring=#%s

" Markdown
Plugin 'godlygeek/tabular'

" HTML
Plugin 'mattn/emmet-vim'


" Coc
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-go',
\ 'coc-python',
\ 'coc-solargraph',
\ 'coc-yaml',
\ 'coc-json',
\ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


"" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
filetype plugin indent on    " required

" --- Key mapping 
imap jk <ESC>
nnoremap <space> za
vnoremap <space> zf
"map      <leader>t :NERDTreeToggle<CR>

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

" --- Sort in visual mode
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
nnoremap <F3> :TlistOpen<CR>

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

""" vim-go
au BufRead,BufNewFile *.go set filetype=go
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_sameids = 1


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
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height = 30
set wildignore+=*.pyc,*/tmp/*,*.so,*.swp,*.zip,*/vendor/*
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

set runtimepath+=$HOME/.vim/plugin
set tags=./tags;~/Projects

" --- Better folding
set nofoldenable

" --Tagbar ctags
nmap <leader>T :TagbarToggle<CR>

" --- Tmux/Vim integration
nnoremap <silent> <ctrl-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <ctrl-j> :TmuxNavigateDown<cr>
nnoremap <silent> <ctrl-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <ctrl-l> :TmuxNavigateRight<cr>
nnoremap <silent> <ctrl-i> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1

" --- Ansible plugin
let g:ansible_options = {'ignore_blank_lines': 0}

" --- Zenroom2 plugin
nnoremap <silent> <leader>z :Goyo<cr>


" --- Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

""--- Gvim
if has("gui_running")
   colorschem badwolf
   set guioptions-=m
   set guioptions-=T
   set guioptions-=r
   set guifont=Monaco:h12
   if has("gui_gtk2")
      set guifont=Lucida\ Console\ 11
      set guifont=Lucida\ Console\ 11
   elseif has("x11")
      " Also for GTK 1
      set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
   elseif has("gui_win32")
      set guifont=Luxi_Mono:h12:cANSI
    endif
 endif
