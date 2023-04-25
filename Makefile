# Build all container images within docker/ directory
build-container-images:
	docker build -t revett/go:latest -f docker/go.dockerfile .
	docker build -t revett/node:latest -f docker/node.dockerfile .

# Build the Go hops CLI for syncing Homebrew packages
build-hops-cli:
	go build -o hops .

# Setup command for the repo
setup:
	./install.sh
	./macos.sh

# Install all VS Code extensions from extensions.txt
vscode-extensions-install:
	cat ~/projects/github.com/revett/dotfiles/vscode/extensions.txt | xargs -n 1 code --install-extension

# Update the list of installed VS Code extensions
vscode-extensions-sync:
	code --list-extensions --show-versions > ~/projects/github.com/revett/dotfiles/vscode/extensions.txt
