#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;35m'
NC='\033[0m' # No Color

function print_break () {
  printf "\n"
}

function print_error () {
  printf " ${RED}✘\n\n$1${NC}\n"
  exit 1
}

function print_intro () {
  printf "        ____\n       ||\"\"||\n       ||__||\nabner  [ -=.]\`)\n       ====== 0\n\n"
}

function print_outro () {
  printf "\n🥳 ${GREEN}success${NC}\n"
}

function print_section () {
  printf "${BLUE}>${NC} $1"
}

function print_success () {
  printf " ${GREEN}✔${NC}\n"
}

print_intro

print_section "correct home directory naming"
if [ "$HOME" != "/Users/revett" ]; then
  print_error "\$HOME does not equal /Users/revett."
fi
print_success

print_section "projects directory exists"
if [ ! -d "/Users/revett/projects/github.com/revett" ]; then
  print_error "Directory /Users/revett/projects/github.com/revett does not exist."
fi
print_success

print_section "valid hostname prefix"
if [[ $(hostname) != 0x726576* ]]; then
  print_error "Hostname does not have 0x726576 prefix."
fi
print_success

print_break

print_section "backing up vscode .extensions"
code --list-extensions --show-versions > ~/.dotfiles/.vscode/.extensions
print_success

print_section "updating brew"
ERROR=$(brew update 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
  print_error "$ERROR"
fi
print_success

print_section "running brew doctor"
ERROR=$(brew doctor 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
  print_error "$ERROR"
fi
print_success

print_section "cleanup for brew"
ERROR=$(brew cleanup 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
  print_error "$ERROR"
fi
print_success

print_section "autoremove for brew"
ERROR=$(brew autoremove 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
  print_error "$ERROR"
fi
print_success

print_section "removing existing brewfile"
ERROR=$(rm -f ~/.dotfiles/Brewfile 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
  print_error "$ERROR"
fi
print_success

print_section "creating new brewfile"
ERROR=$(brew bundle dump --force --cleanup 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
  print_error "$ERROR"
fi
print_success

# Get git repo name, if exists
DIR=""
if [ -d .git ]; then
  DIR=$(basename `git rev-parse --show-toplevel`)
fi

# Move Brewfile to this repo, and delete in working directory
if  [ "$DIR" != "dotfiles" ]; then
  print_section "moving brewfile to ~/.dotfiles"
  ERROR=$(cp -f Brewfile ~/.dotfiles/ 2>&1 > /dev/null)
  if [ $? -ne 0 ]; then
    print_error "$ERROR"
  fi
  print_success

  print_section "removing brewfile from this directory"
  ERROR=$(rm Brewfile 2>&1 > /dev/null)
  if [ $? -ne 0 ]; then
    print_error "$ERROR"
  fi
  print_success
fi

print_outro
