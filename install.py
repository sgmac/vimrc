#!/usr/bin/env python

"""
vim configuration
"""
import os
import sys

home = os.getenv("HOME")

config_path = os.path.join(home, '.config')
target = os.path.join(home, '.config/vim/vimrc')

# nvim
try:
    os.symlink(os.path.join(os.getcwd(), "nvim"), config_path + "/nvim")
    os.symlink(os.path.join(os.getcwd(), "colors"), config_path + "/vim/colors")
except FileExistsError as e:
    print("file exists")

# vimrc
pathvimrc = os.getcwd()
source = os.path.join(pathvimrc,  'vimrc')

if os.path.exists(target):
    proceed = input('A .vimrc file was found. Continue? (Yes/No) ')

    if proceed != 'Yes':
        sys.stderr.write('Aborted vimrc installation.\n')
        sys.exit(1)

    print('Unlink vimrc')
    os.unlink(target)
    print('Create new vimrc')
    print(source, target)
    os.symlink(source, target)
else:
    print('Adding .vimrc')
    os.symlink(source, target)
