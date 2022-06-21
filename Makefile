DEFAULT: run

# Build all container images within docker/ directory
build-container-images:
	docker build -t revett/go:latest -f docker/Dockerfile.go .
	docker build -t revett/node:latest -f docker/Dockerfile.node .

# Generate GMail email filters using script
generate-email-filters:
	./email/generate-filters.sh

# Setup command for the repo
run:
	./install.sh
	./macos.sh

# Install all VS Code extensions from extensions.txt
install-vscode-extensions:
	cat ~/dotfiles/vscode/extensions.txt | xargs -n 1 code --install-extension
