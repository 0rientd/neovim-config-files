FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# -------------------------
# Dependências do sistema (ROOT)
# -------------------------
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
      sudo \
      curl \
      gh \
      git \
      libffi-dev \
      libnode-dev \
      libyaml-dev \
      zlib1g-dev \
      unzip \
      python3 \
      python3-pip \
      python3-venv \
      build-essential \
      ca-certificates \
      dirmngr \
      postgresql \
      gpg \
      gawk \
      ripgrep \
      shared-mime-info \
      libpq-dev \
      zsh \
      gnupg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# -------------------------
# Cria usuário não-root com sudo
# -------------------------
ARG USERNAME=dev
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /usr/bin/zsh ${USERNAME} && \
    usermod -aG sudo ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# -------------------------
# Diretório da aplicação
# -------------------------
WORKDIR /usr/src/app
RUN chown -R dev:dev /usr/src/app

# -------------------------
# Variáveis globais
# -------------------------
ENV HOME=/home/dev
ENV ASDF_DIR=/home/dev/.asdf
ENV PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}"

# -------------------------
# Troca para usuário dev
# -------------------------
USER dev

# Usa zsh como shell para RUN
SHELL ["/usr/bin/zsh", "-lc"]

# -------------------------
# Oh My Zsh (instalação NÃO interativa)
# -------------------------
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh && \
    cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

# -------------------------
# Spaceship Prompt
# -------------------------
RUN git clone https://github.com/spaceship-prompt/spaceship-prompt.git \
      $HOME/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1 && \
    ln -s \
      $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme \
      $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme && \
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="spaceship"/' $HOME/.zshrc

# -------------------------
# Instala asdf (user-level)
# -------------------------
RUN git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.14.0 && \
    echo '\n. "$ASDF_DIR/asdf.sh"' >> $HOME/.zshrc && \
    echo '\n. "$ASDF_DIR/completions/asdf.bash"' >> $HOME/.zshrc

# Plugins
RUN asdf plugin-add ruby && \
    asdf plugin-add nodejs

# Instala versões
RUN asdf install ruby 3.4.6 && \
    asdf install ruby 3.3.6 && \
    asdf install nodejs 20.10.0

# -------------------------
# Instala Neovim (AUTO-DETECT ARCH)
# -------------------------
RUN ARCH="$(uname -m)" && \
    if [ "$ARCH" = "x86_64" ]; then \
      NVIM_ARCH="x86_64"; \
    elif [ "$ARCH" = "aarch64" ]; then \
      NVIM_ARCH="arm64"; \
    else \
      echo "Arquitetura não suportada: $ARCH" && exit 1; \
    fi && \
    curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-${NVIM_ARCH}.tar.gz && \
    tar -C $HOME -xzf nvim-linux-${NVIM_ARCH}.tar.gz && \
    rm nvim-linux-${NVIM_ARCH}.tar.gz

ENV PATH="/home/dev/nvim-linux-arm64/bin:/home/dev/nvim-linux-x86_64/bin:${PATH}"

# -------------------------
# Configuração do Neovim
# -------------------------
RUN git clone https://github.com/0rientd/neovim-config-files.git $HOME/.config/nvim

# -------------------------
# Shell interativo
# -------------------------
CMD ["/usr/bin/zsh"]
