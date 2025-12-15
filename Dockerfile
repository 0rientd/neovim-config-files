FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Atualiza sistema e instala dependências
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
      curl \
      gh \
      git \
      libffi-dev \
      libyaml-dev \
      zlib1g-dev \
      unzip \
      ruby \
      ruby-dev \
      nodejs \
      npm \
      python3 \
      python3-pip \
      python3-venv \
      build-essential \
      ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root

# -------------------------
# Instala Neovim v0.11.5 (binário oficial)
# -------------------------
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz && \
    rm -rf /opt/nvim-linux-x86_64 && \
    tar -C /opt -xzf nvim-linux-x86_64.tar.gz && \
    rm nvim-linux-x86_64.tar.gz

# Adiciona Neovim ao PATH (global)
ENV PATH="/opt/nvim-linux-x86_64/bin:${PATH}"

# -------------------------
# Configuração do Neovim
# -------------------------
RUN git clone https://github.com/0rientd/neovim-config-files.git && \
    mkdir -p /root/.config && \
    mv neovim-config-files /root/.config/nvim

CMD ["/bin/bash"]
