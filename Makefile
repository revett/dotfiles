# Build all container images within docker/ directory
build-container-images:
	docker build -t revett/go:latest -f docker/go.dockerfile .
	docker build -t revett/node:latest -f docker/node.dockerfile .

# Setup command for the repo
setup:
	./install.sh
	./macos.sh
