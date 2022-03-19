#!/bin/bash

pacman -Qq | fzf --preview 'pacman -Si {}' --layout=reverse
