#!/bin/bash

function lazygit() {
  git add .
  git commit -a -m $*
  git push
}

alias gp=lazygit


