FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# -------------------------
# Dependências do sistema
# -------------------------
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
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
      gnupg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# -------------------------
# Cria usuário não-root
# -------------------------
ARG USERNAME=dev
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME}

# -------------------------
# Diretório da aplicação
# -------------------------
WORKDIR /usr/src/app
RUN chown -R dev:dev /usr/src/app

# -------------------------
# Troca para usuário dev
# -------------------------
USER dev
ENV HOME=/home/dev

# -------------------------
# Instala asdf (user-level)
# -------------------------
ENV ASDF_DIR=/home/dev/.asdf
ENV PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}"

RUN git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch v0.14.0 && \
    echo '. "$ASDF_DIR/asdf.sh"' >> ~/.bashrc && \
    echo '. "$ASDF_DIR/completions/asdf.bash"' >> ~/.bashrc

# Plugins
RUN asdf plugin-add ruby && \
    asdf plugin-add nodejs

# Instala versões específicas
RUN asdf install ruby 3.4.6 && \
    asdf install nodejs 22.11.0 && \
    asdf global ruby 3.4.6 && \
    asdf global nodejs 22.11.0

# -------------------------
# Instala Neovim v0.11.5 (binário oficial)
# -------------------------
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz && \
    tar -C /home/dev -xzf nvim-linux-x86_64.tar.gz && \
    rm nvim-linux-x86_64.tar.gz

ENV PATH="/home/dev/nvim-linux-x86_64/bin:${PATH}"

# -------------------------
# Configuração do Neovim
# -------------------------
RUN git clone https://github.com/0rientd/neovim-config-files.git /home/dev/.config/nvim

CMD ["/bin/bash"]

