#!/bin/bash

pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse
