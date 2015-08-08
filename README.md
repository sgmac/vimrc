# Vim configuration

I do have a dotfiles repository but after a long while I realized that the most important thing is a quick setup for my Vim configuration. Besides, I was tired of dealing with git submodules. It's much easier to work with Vundle as your plugin manager.

This procedure has been tested on both Debian and OSX systems.

### My vimrc

There are some vars that should be modified before starting the installation.

```
" Create the path for holding the swp files
set backupdir=~/.vimswp
set directory=~/.vimswp

set runtimepath+=$HOME/.vim/plugin 

" Set your path
let $GOPATH = ""
```

### Compiling Vim

If you decide to compile Vim:

```$ sudo apt-get install git-core python2.7-dev libncurses5-dev python3-dev ruby-dev \
mercurial build-essential cmake```

Bear in mind that Cmake version should be at least 2.8.12.
```
   $ hg clone https://vim.googlecode.com/hg/ vim
   $ cd vim
   $ ./configure  --with-features=huge   --enable-pythoninterp 
				--with-python-config-dir=/usr/lib/python2.7/config
   $ make
   $ sudo make install
```

It's important to set first the python interpreter and after the path to the library, otherwise it does not work. Check the **python-config-dir** exists.


### Install Vundle

Before installing vim plugins we need to install Vundle.

        $ mkdir -p $HOME/.vim/bundle && cd $HOME/.vim/bundle
        $ git clone https://github.com/gmarik/Vundle.vim

### Configure your vimrc for Vundle

Read the documentation for Vundle, the most important thing I found regarding **vim-go** and bundle is to enable syntax and plugin indent just after loading the Vim plugins, otherwise the snippets did not work. This did not happen with pathogen though.

        call vundle#end()
        syntax on                       " After your plugins define syntax.
        filetype plugin indent on	" and filetype.

Open vim and run **:VundleInstall**.

### Compile YouCompleteMe

This awesome tool provides you with autocompletion for Vim.

[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

It takes a while to compile:
```
        $ cd $HOME/.vim/bundle/YouCompleteMe
        $ ./install --clang-completer #  C/C++ support
```
Check the different options from the install script.

### Vim-go

This plugin is a must for Go development, the only thing to have in mind:

**IMPORTANT**: Set up your Go development environment beforhand.

        $ mkdir -p $HOME/projects/gocode/{pkg,src,bin}
        $ echo "export GOPATH=$HOME/projects/gocode"
        $ echo "export PATH=$PATH:$GOPATH/bin"

Once you have the environment, open a Vim session and run the command **:GoInstallBinaries**, this fetches some
tools and installs them on your $GOPATH.
