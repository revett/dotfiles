DEFAULT: run

generate-email-filters:
	./email/generate-filters.sh

run:
	./install.sh
	./macos.sh

install-vscode-extensions:
	cat ~/dotfiles/vscode/extensions.txt | xargs -n 1 code --install-extension
