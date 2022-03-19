#!/bin/bash

yay -Slq | fzf --preview 'yay -Si {}' --layout=reverse
