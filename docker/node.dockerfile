FROM node:18.18

# Install Zsh
RUN apt update
RUN apt install zsh -y
RUN apt clean autoclean

# Change working directory for building of image
WORKDIR /home/node

# Install Starship
ADD starship.toml /home/node/.config/starship.toml
RUN curl https://starship.rs/install.sh --output starship-install.sh
RUN chmod +x starship-install.sh
RUN ./starship-install.sh --verbose --force
RUN rm starship-install.sh

# Install font for Starship
RUN git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
RUN cd nerd-fonts && git sparse-checkout add patched-fonts/ProFont
RUN ./nerd-fonts/install.sh ProFont
RUN rm -rf nerd-fonts/

USER node

# Configure shell startup
ADD docker/startup.sh /home/node
RUN touch ~/.zshrc
RUN echo 'PATH=$PATH:/usr/local/bin/' >> ~/.zshrc
RUN echo 'eval "$(starship init zsh)"' >> ~/.zshrc
RUN echo '~/startup.sh' >> ~/.zshrc

# Change working directory for when container is running
WORKDIR /home/node/app

ENTRYPOINT ["zsh"]
