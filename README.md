# Vim configuration

My vim configuration changes overtime. After watching a Luke Smith's video about polluting your home directory with hidden folders or files, I decided to move NVim/Vim configuration to `~/.config/vim`. In this way you get a cleaner and tidy home. 

### My vimrc

There are some vars that should be modified before starting the installation.

" Set your path
let $GOPATH = ""
```

### Packer

```
$ .local/share/nvim/site/pack/packer/start/coc.nvim
```


### Coc.vim

This requires to install `nodejs/npm`. This requires 

```
 │  Current Node.js version v12.22.9 < 14.14.0
```

Install neovim extensions

```
$ npm install neovim`
$ pip install pyx
```

```
$ cd ~/.config/vim/plug/coc.nvim
$ npm install
```

### LanguageServer

```
$ cd /home/sgm/.config/vim/plug/LanguageClient-neovim
$ ./install.sh
```

## Devicons

## Vim-go

This plugin is a must for Go development.

Once you have the environment, open a Vim session and run the command **:GoInstallBinaries**, this fetches some
tools to your $GOPATH.

### Installing

From vim run:

- `PlugInstall`
- `GoInstallBinaries`

From the shell is required to install `LanguageServer` to have completion. Go to `bundle/LangueClient-neovim` and run `install.sh`.

