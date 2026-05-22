# 🚀 Neovim IDE Config

Uma configuração pessoal do Neovim que transforma seu editor em uma IDE moderna e eficiente. Funciona em **Windows**, **macOS** e **Linux**.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)

---

## ✨ Features

| Feature | Plugin | Descrição |
|---------|--------|-----------|
| ⚡️ Plugin Manager | `lazy.nvim` | Carregamento lazy para inicialização rápida |
| 🎨 Tema | `yoda.nvim` | Tema moderno com suporte a transparência |
| 🧠 LSP | `nvim-lspconfig` + `mason.nvim` | Autocomplete, diagnósticos e navegação de código |
| 🌲 File Explorer | `neo-tree.nvim` | Explorador de arquivos com ícones |
| 🔍 Fuzzy Finder | `telescope.nvim` | Busca de arquivos, texto, comandos e mais |
| 🌈 Syntax Highlight | `nvim-treesitter` | Destaque de sintaxe preciso |
| 📊 Statusline | `lualine.nvim` | Barra de status informativa |
| 💻 Terminal | `FTerm.nvim` | Terminal flutuante integrado |
| 🤖 AI Assistant | `copilot.vim` | GitHub Copilot para sugestões de código |
| 📝 Markdown | `markview.nvim` | Preview de Markdown inline |
| 🔀 Git | `diffview.nvim` + `git-conflict.nvim` | Visualização de diffs e resolução de conflitos |
| ⌨️ Keymaps | `which-key.nvim` | Ajuda interativa de atalhos |
| 🎯 Focus | `twilight.nvim` | Modo foco para concentração |
| 💬 UI | `noice.nvim` | UI moderna para mensagens e comandos |

---

## 📦 Requisitos

### Todos os Sistemas

- **Neovim** >= 0.10.0
- **Git** >= 2.19.0
- **Node.js** >= 18 (para alguns LSPs)
- Uma [Nerd Font](https://www.nerdfonts.com/) instalada e configurada no terminal

### Windows

```powershell
# Via Scoop (recomendado)
scoop install neovim git ripgrep fd

# Via Chocolatey
choco install neovim git ripgrep fd

# Via Winget
winget install Neovim.Neovim Git.Git BurntSushi.ripgrep.MSVC sharkdp.fd
```

### macOS

```bash
brew install neovim git ripgrep fd
```

### Linux (Ubuntu/Debian)

```bash
# Neovim (versão mais recente)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Dependências
sudo apt install git ripgrep fd-find
```

---

## 🚀 Instalação

### 1. Backup da configuração atual (se existir)

```bash
# Linux/macOS
mv ~/.config/nvim ~/.config/nvim.backup

# Windows (PowerShell)
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
```

### 2. Clone este repositório

```bash
# Linux/macOS
git clone https://github.com/0rientd/neovim-config-files.git ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/0rientd/neovim-config-files.git $env:LOCALAPPDATA\nvim
```

### 3. Inicie o Neovim

```bash
nvim
```

Na primeira execução, os plugins serão instalados automaticamente pelo `lazy.nvim`.

### 4. Instale LSPs (opcional)

Abra o Neovim e execute:

```vim
:Mason
```

Use `i` para instalar os servidores de linguagem que você precisa:

| Linguagem | Servidor |
|-----------|----------|
| Lua | `lua_ls` |
| TypeScript/JavaScript | `ts_ls` |
| Python | `pylsp` |
| Ruby | `ruby-lsp` (instalar via gem) |
| C/C++ | `clangd` |
| HTML/CSS | `html`, `cssls` |
| JSON | `jsonls` |
| YAML | `yamlls` |

---

## ⌨️ Atalhos Principais

> A tecla `<leader>` é `Espaço`

### Essenciais

| Tecla | Ação |
|-------|------|
| `<leader>?` | Mostrar atalhos disponíveis |
| `<leader>k` | Buscar todos os keymaps |
| `Ctrl+p` | Buscar arquivos |
| `Ctrl+n` | Abrir explorador de arquivos |
| `<leader>fg` | Buscar texto no projeto |
| `<leader>ft` | Abrir terminal |

### LSP

| Tecla | Ação |
|-------|------|
| `K` | Documentação hover |
| `gd` | Ir para definição |
| `gr` | Encontrar referências |
| `<leader>ca` | Ações de código |
| `<leader>rn` | Renomear símbolo |
| `<leader>gf` | Formatar código |

### Git

| Tecla | Ação |
|-------|------|
| `<leader>gd` | Abrir diff view |
| `<leader>gh` | Histórico do arquivo |
| `<leader>gs` | Git status (Telescope) |

📖 **Documentação completa:** Veja [COMMANDS.md](COMMANDS.md) para a lista completa de atalhos.

---

## 📁 Estrutura do Projeto

```
~/.config/nvim/
├── init.lua              # Configuração principal
├── lazy-lock.json        # Lock file dos plugins
├── COMMANDS.md           # Documentação de comandos
└── lua/
    ├── vim-options.lua   # Opções gerais do Vim
    └── plugins/          # Configurações de plugins
        ├── alpha.lua         # Dashboard
        ├── diffview.lua      # Git diff
        ├── everforest.lua    # Tema alternativo
        ├── fterm.lua         # Terminal flutuante
        ├── git-conflict.lua  # Resolução de conflitos
        ├── github-copilot.lua # GitHub Copilot
        ├── lsp-config.lua    # LSP + Mason
        ├── lualine.lua       # Statusline
        ├── markview.lua      # Markdown preview
        ├── neo-tree.lua      # File explorer
        ├── neoscroll.lua     # Scroll suave
        ├── noice.lua         # UI moderna
        ├── none-ls.lua       # Formatters/Linters
        ├── telescope.lua     # Fuzzy finder
        ├── treesitter.lua    # Syntax highlighting
        ├── twilight.lua      # Modo foco
        ├── which-key.lua     # Ajuda de teclas
        └── yoda.lua          # Tema principal
```

---

## 🔧 Personalização

### Mudar o Tema

Edite `lua/plugins/yoda.lua` ou descomente em `lua/plugins/everforest.lua`:

```lua
-- vim.cmd.colorscheme "everforest"
```

### Adicionar um LSP

1. Instale via Mason: `:MasonInstall <nome-do-lsp>`
2. Ou adicione em `lua/plugins/lsp-config.lua`:

```lua
lspconfig.nome_do_lsp.setup({ capabilities = capabilities })
```

### Adicionar Formatters/Linters

Edite `lua/plugins/none-ls.lua` e adicione na lista de sources.

---

## 🐳 Docker (Ambiente de Teste)

Quer testar sem modificar seu sistema? Use o Docker!

```bash
# Build
docker build -t nvim-ide .

# Run
docker run -it --rm nvim-ide

# Dentro do container
nvim
```

> **Nota:** Para testar alterações locais, modifique o `Dockerfile` conforme instruções no próprio arquivo.

---

## 🔍 Troubleshooting

### Plugins não carregam

```vim
:Lazy sync
```

### LSP não funciona

```vim
:LspInfo
:checkhealth lsp
```

### Ícones não aparecem

Instale uma [Nerd Font](https://www.nerdfonts.com/) e configure seu terminal para usá-la.

### Erros no Windows

Verifique se o PowerShell está configurado corretamente:

```powershell
# Verifique a versão
$PSVersionTable.PSVersion

# Deve ser 5.1 ou superior, preferencialmente PowerShell 7+
```

### Verificação geral de saúde

```vim
:checkhealth
```

---

## 📝 Comandos Úteis

| Comando | Descrição |
|---------|-----------|
| `:Lazy` | Gerenciar plugins |
| `:Mason` | Gerenciar LSPs |
| `:checkhealth` | Verificar instalação |
| `:Telescope keymaps` | Buscar atalhos |
| `:LspInfo` | Info do LSP ativo |

---

## 🤝 Contribuindo

Sinta-se à vontade para abrir issues ou PRs com melhorias!

---

## 📄 Licença

MIT License - veja [LICENSE](LICENSE) para detalhes.

---

<p align="center">
  <sub>Made with ❤️ and ☕</sub>
</p>
