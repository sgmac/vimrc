# Vim configuration

My vim configuration changes overtime, although has been pretty stable for a long while. After watching a Luke Smith's video about polluting your home directory with hidden folders or files, I decided to move NVim/Vim configuration to `~/.config/vim`. In this way you get a cleaner and tidy home. 


### My vimrc

There are some vars that should be modified before starting the installation.

```bash
" Create the path for holding the swp files
set backupdir=~/.vimswp
set directory=~/.vimswp

set runtimepath+=$HOME/.vim/plugin 

" Set your path
let $GOPATH = ""
```

### Install Vundle

Before installing vim plugins we need to install Vundle.

```bash
$ mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim
```

### Configure your vimrc for Vundle

Read the documentation for Vundle, the most important thing I found regarding **vim-go** and bundle is to enable syntax and plugin indent just after loading the Vim plugins, otherwise the snippets did not work. This did not happen with pathogen though.

        call vundle#end()
        syntax on                       " After your plugins define syntax.
        filetype plugin indent on	" and filetype.

Open vim and run **:VundleInstall**.

### Coc.vim

I loved [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) but after sometime I was facing errors too often with `vim-go`, therefore I decided to move forward with `coc.nvim`


### Vim-go

This plugin is a must for Go development.

**IMPORTANT**: Set up your Go development environment beforehand.

Once you have the environment, open a Vim session and run the command **:GoInstallBinaries**, this fetches some
tools to your $GOPATH.
