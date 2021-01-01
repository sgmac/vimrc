set runtimepath^=~/.config/vim runtimepath+=~/.config/vim/after
let &packpath = &runtimepath


"" Golang
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

source ~/.config/vim/.vimrc
