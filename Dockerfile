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
      gnupg && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app/

# -------------------------
# Instala asdf
# -------------------------
ENV ASDF_DIR=/root/.asdf
ENV PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}"

RUN git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch v0.14.0

# Plugins
RUN asdf plugin-add ruby && \
    asdf plugin-add nodejs

# Instala versões específicas
RUN asdf install ruby 3.3.6 && \
    asdf install nodejs 22.11.0 && \
    asdf global ruby 3.3.6 && \
    asdf global nodejs 22.11.0

# -------------------------
# Instala Neovim v0.11.5 (binário oficial)
# -------------------------
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz && \
    rm -rf /opt/nvim-linux-x86_64 && \
    tar -C /opt -xzf nvim-linux-x86_64.tar.gz && \
    rm nvim-linux-x86_64.tar.gz

# Neovim no PATH
ENV PATH="/opt/nvim-linux-x86_64/bin:${PATH}"

# -------------------------
# Configuração do Neovim
# -------------------------
RUN git clone https://github.com/0rientd/neovim-config-files.git && \
    mkdir -p /root/.config && \
    mv neovim-config-files /root/.config/nvim

CMD ["/bin/bash"]
