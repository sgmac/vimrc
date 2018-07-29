#!/usr/bin/env python

# What does the install?
#  1. Link vimrc to ~/.vimrc
#  2. If exists, asks the user there is a version (from show date?)
# .. Do you want to replace?
#  3. If ~/.vim does not exist, create and link 'colors' inside
#  4. Clone  Vundle and create structure
#
import os
import sys

home = os.getenv('HOME')
target = os.path.join(home, '.vimrc')

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
