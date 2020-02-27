set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


"" Golang
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

source ~/.vimrc
