#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;35m'
NC='\033[0m' # No Color

function print_error () {
  printf " ${RED}✘\n\nError: $1${NC}\n"
  exit 1
}

function print_intro () {
  printf "        ____\n       ||\"\"||\n       ||__||\nabner  [ -=.]\`)\n       ====== 0\n\n"
}

function print_outro () {
  printf "\n🥳 ${GREEN}Success${NC}\n"
}

function print_section () {
  printf "${BLUE}>${NC} $1"
}

function print_success () {
  printf " ${GREEN}✔${NC}\n"
}

print_intro

print_section "Checking name of home directory"
if [ "$HOME" != "/Users/revett" ]; then
  print_error "\$HOME does not equal /Users/revett."
fi
print_success

print_section "Checking for projects directory"
if [ ! -d "/Users/revett/projects/github.com/revett" ]; then
  print_error "Directory /Users/revett/projects/github.com/revett does not exist."
fi
print_success

print_section "Checking prefix for hostname"
if [[ $(hostname) != 0x726576* ]]; then
  print_error "Hostname does not have 0x726576 prefix."
fi
print_success

print_outro
