DEFAULT: run

build-container-images:
	docker build -t revett/go:latest -f docker/Dockerfile.go .
	docker build -t revett/node:latest -f docker/Dockerfile.node .

generate-email-filters:
	./email/generate-filters.sh

run:
	./install.sh
	./macos.sh

install-vscode-extensions:
	cat ~/dotfiles/vscode/extensions.txt | xargs -n 1 code --install-extension
