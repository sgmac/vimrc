# Vim configuration

My vim configuration changes overtime. After watching a Luke Smith's video about polluting your home directory with hidden folders or files, I decided to move NVim/Vim configuration to `~/.config/vim`. In this way you get a cleaner and tidy home. 

### My vimrc

There are some vars that should be modified before starting the installation.

```bash
" Create the path for holding the swp files
set backupdir=~/.vimswp
set directory=~/.vimswp


" Set your path
let $GOPATH = ""
```

### Install Plug

Before installing any vim plugins, install Plug.

```bash
$ cd ~/.config/vim
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \   
                    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Configure Plug

call plug#begin("~/.config/vim/plug")
// Plugins
call plug#end()          

Open vim and run **:PlugInstall**.

### Coc.vim

This requires to install `nodejs/npm`.

```
$ cd ~/.config/vim/plug/coc.nvim
$ npm install
```

### LanguageServer

```
$ cd /home/sgm/.config/vim/plug/LanguageClient-neovim
$ ./install.sh
```

## Vim-go

This plugin is a must for Go development.

Once you have the environment, open a Vim session and run the command **:GoInstallBinaries**, this fetches some
tools to your $GOPATH.

### Installing

From vim run:

- `PlugInstall`
- `GoInstallBinaries`

From the shell is required to install `LanguageServer` to have completion. Go to `bundle/LangueClient-neovim` and run `install.sh`.

