#!/bin/bash
# Run 'asd' to see outline of usage.
# Named because typing 'asd' is very easy.
# Author: https://github.com/revett/dev-env

# Immediately stop script if a single commands fails.
set -e

# ---
# PUBLIC FUNCTIONS
# ---

function dc_dangling_images {
  if [ "$1" = "-h" ]; then
    output_usage "Deletes any Docker image which is in a 'dangling' state."
    return 0
  fi

  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

function dc_exited_containers {
  if [ "$1" = "-h" ]; then
    output_usage "Deletes any Docker container which is in a 'stopped' state."
    return 0
  fi

  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
}

function dc_old_images {
  if [ "$1" = "-h" ]; then
    output_usage "Deletes any Docker image created over 14 days ago."
    return 0
  fi

  docker rmi $(docker images | grep 'months ago\|weeks ago' | awk '{print $3}' 2>/dev/null) 2>/dev/null
}

function fs {
  if [ "$1" = "-h" ]; then
    output_usage "Outputs size of each file/directory in current directory."
    return 0
  fi

  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi

  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

function gh_o {
  if [ "$1" = "-h" ]; then
    output_usage "Opens current git directory's Github web page."
    return 0
  fi

  open https://github.$(generate_github_url)
}

function gh_pr {
  if [ "$1" = "-h" ]; then
    output_usage "Opens new Github pull request, comparing current branch to master."
    return 0
  fi

  open https://github.$(generate_github_url)/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1
}

function guid {
  if [ "$1" = "-h" ]; then
    output_usage "Outputs a random lowercase GUID/UUID and copies to clipboard."
    return 0
  fi

  uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste
}

function init {
  if [ "$1" = "-h" ]; then
    output_usage "Create a number of symlinks to user's home."
    return 0
  fi

  ln -sf ~/code/other/github.com/revett/dev-env/dotfiles/.gitconfig ~/.gitconfig
  ln -sf ~/code/other/github.com/revett/dev-env/dotfiles/.zshrc ~/.zshrc
}

function live_version {
  if [ "$1" = "-h" ]; then
    output_usage "Checks the version of a LIVE Docker image."
    return 0
  fi

  if [ "$#" -ne 1 ]; then
    output_error "must provide single argument, name of Docker image"
  fi

  docker pull vidsyhq/$1:live
  docker inspect -f '{{index .ContainerConfig.Labels.version }}' vidsyhq/$1:live
}

function pwd {
  if [ "$1" = "-h" ]; then
    output_usage "Outputs a random lowercase 30 character string and copies to clipboard."
    return 0
  fi

  dd if=/dev/urandom bs=1 count=30 2>/dev/null | base64 | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste
}

function tre {
  if [ "$1" = "-h" ]; then
    output_usage "Lists structure of directory."
    return 0
  fi

  tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# ---
# PRIVATE FUNCTIONS
# ---

find_all_functions() {
  if [ "$1" = "-h" ]; then return 0; fi
  local functions=`declare -F -p | cut -d " " -f 3`;
  echo $functions;
}

generate_github_url() {
  if [ "$1" = "-h" ]; then return 0; fi
  git config remote.origin.url | cut -f2 -d. | tr ':' /
}

output_error() {
  if [ "$1" = "-h" ]; then return 0; fi
  printf "\e[31;4mERROR\e[0m: $1\n"
  exit 1
}

output_usage() {
  if [ "$1" = "-h" ]; then return 0; fi

  local function_name=${FUNCNAME[1]}
  local function_name_size=${#function_name}

  if [ $function_name_size -gt 15 ]; then
    printf "\t$function_name\t\e[37m$1\e[39m\n"
  elif [ $function_name_size -gt 10 ]; then
    printf "\t$function_name\t\t\e[37m$1\e[39m\n"
  else
    printf "\t$function_name\t\t\t\e[37m$1\e[39m\n"
  fi
}

# ---
# BEGIN
# ---

if [ "$#" -lt 1 ]; then
  printf "\e[36mUsage:\e[39m asd <cmd> <args...>\n\n"
  printf "\e[36mCommands:\e[39m"
  printf "\t$function_name\t\t\t$1\n"
  list_functions=($(find_all_functions));
  for i in "${list_functions[@]}"
  do
     :
     $i "-h"
  done
  exit 0
fi

case $1 in
  "dc_dangling_images") dc_dangling_images $2;;
  "dc_exited_containers") dc_exited_containers $2;;
  "dc_old_images") dc_old_images $2;;
  "fs") fs $2;;
  "gh_o") gh_o $2;;
  "gh_pr") gh_pr $2;;
  "guid") guid $2;;
  "init") init $2;;
  "live_version") live_version $2;;
  "pwd") pwd $2;;
  "tre") tre $2;;
  *) output_error "'$1' command not recognised.";;
esac
