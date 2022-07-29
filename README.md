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

-- Replace with Plug much faster
--- don't forget to run `yarn install ` -> CoC
--- Install  neovim in that python3 version you have (pyenv I'm using)
--- set python3 environment in configuration (copy line)
--- install LanguageServer

### Install Vundle

Before installing vim plugins we need to install Vundle.

```bash
$ mkdir -p $HOME/.config/vim/bundle && cd $HOME/config/vim/bundle
$ git clone https://github.com/gmarik/Vundle.vim
```

### Configure your vimrc for Vundle

Read the documentation for Vundle, the most important thing I found regarding **vim-go** and bundle is to enable syntax and plugin indent just after loading the Vim plugins, otherwise the snippets did not work. This did not happen with pathogen though.

        call vundle#end()
        syntax on                       " After your plugins define syntax.
        filetype plugin indent on	" and filetype.

Open vim and run **:VundleInstall**.

### Coc.vim

This requires to install `nodejs/npm`.

### Vim-go

This plugin is a must for Go development.

**IMPORTANT**: Set up your Go development environment beforehand.

Once you have the environment, open a Vim session and run the command **:GoInstallBinaries**, this fetches some
tools to your $GOPATH.


### Installing

From vim run:

- `VundleInstall`
- `GoInstallBinaries`

From the shell is required to install `LanguageServer` to have completion. Go to `bundle/LangueClient-neovim` and run `install.sh`.

