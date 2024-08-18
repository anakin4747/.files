#!/usr/bin/python3

from pynvim import attach
import sys

nvim = attach('socket', path='/tmp/nvim.pipe')

initial_winnr = nvim.current.window.number

nvim.command('wincmd ' + sys.argv[1])

if initial_winnr == nvim.current.window.number:
    exit(1)
