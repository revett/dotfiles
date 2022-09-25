# Build all container images within docker/ directory
build-container-images:
	docker build -t revett/go:latest -f docker/Dockerfile.go .
	docker build -t revett/node:latest -f docker/Dockerfile.node .

# Build the Go hops CLI for syncing Homebrew packages
build-hops-cli:
	go build -o hops .

# Generate Gmail email filters using shell script
generate-email-filters:
	./email/generate-filters.sh

# Install all VS Code extensions from extensions.txt
install-vscode-extensions:
	cat ~/projects/github.com/revett/dotfiles/vscode/extensions.txt | xargs -n 1 code --install-extension

# Setup command for the repo
setup:
	./install.sh
	./macos.sh
