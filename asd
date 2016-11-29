#!/bin/bash
# Run 'asd' to see outline of usage.
# Named because typing 'asd' is very easy.
# Author: https://github.com/revett/dev-env

# Immediately stop script if a single commands fails.
set -e

# ---
# FUNCTIONS
# ---

# calculateFilesize outputs the size of each file and directory in the current
# directory.
# Author: https://github.com/jessfraz/dotfiles
function calculateFilesize {
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

# createDotfileSymlinks creates a number of symlinks to the users home
# directory, warning; this deletes the existing files.
function createDotfileSymlinks {
  ln -sf ~/projects/code/github.com/revett/dev-env/dotfiles/.gitconfig ~/.gitconfig
  ln -sf ~/projects/code/github.com/revett/dev-env/dotfiles/.zshrc ~/.zshrc
}

# generateGithubURL is a git related helper function that creates a Github URL
# based of the current directory/repo.
function generateGithubURL {
  git config remote.origin.url | cut -f2 -d. | tr ':' /
}

# generateGUID outputs a random GUID/UUID (lowercase) and copies it to the
# clipboard.
function generateGUID {
  uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste
}

# generatePassword outputs a random 30 character string (lowercase) and copies
# it to the clipboard.
function generatePassword {
  dd if=/dev/urandom bs=1 count=30 2>/dev/null | base64 | tr '[:upper:]' '[:lower:]' | pbcopy && pbpaste
}

# listCommands outputs a list of all the available commands.
function listCommands {
  printf "\e[36mUsage:\e[39m asd <cmd> <args...>\n\n"
  printf "\e[36mCommands:\e[39m\n"
  printf " - dc-exited-containers\n"
  printf " - dc-dangling-images\n"
  printf " - dc-old-images\n"
  printf " - guid\n"
  printf " - gh-o\n"
  printf " - gh-pr\n"
  printf " - init\n"
  printf " - ls\n"
  printf " - pwd\n"
  printf " - tree\n"
}

# openGithubPR opens a Github new pull request page in the browser for the
# current repo, and the current branch when compared against the master branch.
function openGithubPR {
  open https://github.$(generateGithubURL)/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1
}

# openGithubURL opens the current git repo's Github home page in the browser.
function openGithubURL {
  open https://github.$(generateGithubURL)
}

# outputError is a helper function to print pretty errors.
function outputError {
  printf "\e[31;4mERROR\e[0m: $1\n"
  exit 1
}

# removeExitedDockerContainers deletes any Docker containers which is in a
# 'stopped' state.
function removeExitedDockerContainers {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
}

# removeDanglingDockerImages deletes any Docker image which is in a
# 'dangling' state.
function removeDanglingDockerImages {
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# removeOldDockerImages deletes any Docker image created over 14 days ago.
function removeOldDockerImages {
  docker rmi $(docker images | grep 'months ago\|weeks ago' | awk '{print $3}' 2>/dev/null) 2>/dev/null
}

# showDirectoryTree uses tree to show the structure of a directory. It is
# color enabled, shows hidden files and ignores the '.git' directory.
# Author: https://github.com/jessfraz/dotfiles
function showDirectoryTree {
  tree -aC -I '.git' --dirsfirst "$@" | less -FRNX
}

# ---
# BEGIN
# ---

if [ "$#" -lt 1 ]; then
  listCommands
  exit 1
fi

case $1 in
  "dc-exited-containers") removeExitedDockerContainers;;
  "dc-dangling-images") removeDanglingDockerImages;;
  "dc-old-images") removeOldDockerImages;;
  "fs") calculateFilesize;;
  "gh-o") openGithubURL;;
  "gh-pr") openGithubPR;;
  "guid") generateGUID;;
  "init") createDotfileSymlinks;;
  "ls") listCommands;;
  "pwd") generatePassword;;
  "tree") showDirectoryTree;;
  *) outputError "'$1' command not recognised.";;
esac