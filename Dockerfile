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
      ruby \
      ruby-dev \
      npm \
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
# Instala NodeJS 22 (NodeSource)
# -------------------------
RUN NODE_MAJOR=22 && \
    apt-get purge -y nodejs libnode-dev node-* && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | \
      gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" \
      > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs

# -------------------------
# Instala asdf
# -------------------------
ENV ASDF_DIR=/root/.asdf

RUN git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch v0.14.0

# asdf no PATH (para build e runtime)
ENV PATH="${ASDF_DIR}/bin:${ASDF_DIR}/shims:${PATH}"

# Carrega asdf automaticamente no bash
RUN echo '. "$ASDF_DIR/asdf.sh"' >> /root/.bashrc && \
    echo '. "$ASDF_DIR/completions/asdf.bash"' >> /root/.bashrc && \
    asdf plugin-add ruby && \
    asdf plugin-add nodejs && \
    asdf global ruby latest && \
    asdf global nodejs latest

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

