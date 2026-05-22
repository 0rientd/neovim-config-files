# 📖 Guia de Comandos do Neovim

Este documento contém todos os atalhos e comandos disponíveis nesta configuração do Neovim.

> **Nota:** A tecla `<leader>` está configurada como `Espaço`.

---

## 📑 Índice

- [Navegação Básica](#-navegação-básica)
- [Edição de Texto](#-edição-de-texto)
- [Arquivos e Buffers](#-arquivos-e-buffers)
- [Janelas (Splits)](#-janelas-splits)
- [Telescope (Busca)](#-telescope-busca)
- [Neo-tree (Explorador)](#-neo-tree-explorador)
- [LSP (Linguagem)](#-lsp-linguagem)
- [Git](#-git)
- [Terminal](#-terminal)
- [Ferramentas](#-ferramentas)
- [Comandos Ex](#-comandos-ex)

---

## 🧭 Navegação Básica

### Movimento do Cursor

| Tecla | Descrição |
|-------|-----------|
| `h` | Mover para esquerda |
| `j` | Mover para baixo |
| `k` | Mover para cima |
| `l` | Mover para direita |
| `w` | Próxima palavra |
| `b` | Palavra anterior |
| `e` | Fim da palavra |
| `0` | Início da linha |
| `$` | Fim da linha |
| `^` | Primeiro caractere não-branco |
| `gg` | Início do arquivo |
| `G` | Fim do arquivo |
| `{` | Parágrafo anterior |
| `}` | Próximo parágrafo |
| `%` | Ir para par correspondente (parênteses, chaves) |
| `Ctrl+d` | Meia página para baixo |
| `Ctrl+u` | Meia página para cima |
| `Ctrl+f` | Página inteira para baixo |
| `Ctrl+b` | Página inteira para cima |

### Pesquisa

| Tecla | Descrição |
|-------|-----------|
| `/texto` | Buscar texto para frente |
| `?texto` | Buscar texto para trás |
| `n` | Próxima ocorrência |
| `N` | Ocorrência anterior |
| `*` | Buscar palavra sob o cursor |
| `#` | Buscar palavra sob o cursor (reverso) |
| `<leader>h` | Limpar destaque da busca |

---

## ✏️ Edição de Texto

### Modos

| Tecla | Descrição |
|-------|-----------|
| `i` | Modo insert (antes do cursor) |
| `I` | Modo insert (início da linha) |
| `a` | Modo insert (após o cursor) |
| `A` | Modo insert (fim da linha) |
| `o` | Nova linha abaixo |
| `O` | Nova linha acima |
| `v` | Modo visual (caractere) |
| `V` | Modo visual (linha) |
| `Ctrl+v` | Modo visual (bloco) |
| `Esc` | Voltar ao modo normal |

### Operações

| Tecla | Descrição |
|-------|-----------|
| `x` | Deletar caractere |
| `dd` | Deletar linha |
| `D` | Deletar até o fim da linha |
| `yy` | Copiar linha |
| `Y` | Copiar até o fim da linha |
| `p` | Colar após |
| `P` | Colar antes |
| `u` | Desfazer |
| `Ctrl+r` | Refazer |
| `.` | Repetir última ação |
| `cc` | Mudar linha inteira |
| `C` | Mudar até o fim da linha |
| `r{char}` | Substituir caractere |
| `~` | Alternar maiúscula/minúscula |
| `>>` | Indentar linha |
| `<<` | Remover indentação |
| `J` | Juntar linha com a próxima |

### Modo Visual

| Tecla | Descrição |
|-------|-----------|
| `J` | Mover seleção para baixo |
| `K` | Mover seleção para cima |
| `<` | Remover indentação (mantém seleção) |
| `>` | Adicionar indentação (mantém seleção) |
| `p` | Colar sem perder o clipboard |

---

## 📁 Arquivos e Buffers

### Arquivos

| Tecla | Descrição |
|-------|-----------|
| `<leader>w` | Salvar arquivo |
| `<leader>q` | Sair |
| `<leader>Q` | Forçar sair de todos |
| `<leader>vc` | Editar configuração do Neovim |

### Buffers

| Tecla | Descrição |
|-------|-----------|
| `<leader>bn` | Próximo buffer |
| `<leader>bp` | Buffer anterior |
| `<leader>bd` | Fechar buffer |
| `<leader>bl` | Listar buffers |
| `<leader>fb` | Telescope: Buscar buffers |

---

## 🪟 Janelas (Splits)

### Navegação entre Janelas

| Tecla | Descrição |
|-------|-----------|
| `Ctrl+h` | Mover para janela esquerda |
| `Ctrl+j` | Mover para janela abaixo |
| `Ctrl+k` | Mover para janela acima |
| `Ctrl+l` | Mover para janela direita |

### Redimensionar Janelas

| Tecla | Descrição |
|-------|-----------|
| `Ctrl+Up` | Diminuir altura |
| `Ctrl+Down` | Aumentar altura |
| `Ctrl+Left` | Diminuir largura |
| `Ctrl+Right` | Aumentar largura |

### Criar Janelas (comandos Ex)

| Comando | Descrição |
|---------|-----------|
| `:split` ou `:sp` | Dividir horizontalmente |
| `:vsplit` ou `:vs` | Dividir verticalmente |
| `:close` | Fechar janela |
| `:only` | Fechar todas exceto atual |

---

## 🔭 Telescope (Busca)

| Tecla | Descrição |
|-------|-----------|
| `Ctrl+p` | Buscar arquivos |
| `<leader>ff` | Buscar arquivos |
| `<leader>fg` | Buscar texto (live grep) |
| `<leader>fb` | Buscar buffers |
| `<leader>fh` | Buscar help tags |
| `<leader>fo` | Arquivos recentes |
| `<leader>fc` | Buscar comandos |
| `<leader>fk` | Buscar keymaps |
| `<leader>fr` | Buscar registros |
| `<leader>fs` | Símbolos do documento |
| `<leader>td` | Diagnósticos |

### Git no Telescope

| Tecla | Descrição |
|-------|-----------|
| `<leader>gc` | Git commits |
| `<leader>gs` | Git status |
| `<leader>gb` | Git branches |

### Navegação no Telescope

| Tecla | Descrição |
|-------|-----------|
| `Ctrl+j` | Próximo item |
| `Ctrl+k` | Item anterior |
| `Enter` | Abrir seleção |
| `Ctrl+x` | Abrir em split horizontal |
| `Ctrl+v` | Abrir em split vertical |
| `Ctrl+t` | Abrir em nova tab |
| `Esc` | Fechar Telescope |

---

## 📂 Neo-tree (Explorador)

| Tecla | Descrição |
|-------|-----------|
| `Ctrl+n` | Abrir/fechar Neo-tree |
| `<leader>e` | Toggle explorador |
| `<leader>bf` | Explorador de buffers |

### Dentro do Neo-tree

| Tecla | Descrição |
|-------|-----------|
| `Enter` | Abrir arquivo/pasta |
| `o` | Abrir arquivo |
| `a` | Criar arquivo/pasta |
| `d` | Deletar |
| `r` | Renomear |
| `c` | Copiar |
| `x` | Cortar |
| `p` | Colar |
| `y` | Copiar nome do arquivo |
| `Y` | Copiar caminho relativo |
| `gy` | Copiar caminho absoluto |
| `H` | Mostrar/ocultar arquivos ocultos |
| `R` | Atualizar |
| `?` | Mostrar ajuda |

---

## 🧠 LSP (Linguagem)

### Navegação

| Tecla | Descrição |
|-------|-----------|
| `K` | Documentação hover |
| `gd` | Ir para definição |
| `gD` | Ir para declaração |
| `gi` | Ir para implementação |
| `gr` | Encontrar referências |
| `<leader>D` | Definição de tipo |

### Ações

| Tecla | Descrição |
|-------|-----------|
| `<leader>rn` | Renomear símbolo |
| `<leader>ca` | Ações de código |
| `<leader>gf` | Formatar código |
| `<leader>ds` | Símbolos do documento |
| `<leader>ws` | Símbolos do workspace |

### Diagnósticos

| Tecla | Descrição |
|-------|-----------|
| `<leader>e` | Mostrar diagnóstico |
| `[d` | Diagnóstico anterior |
| `]d` | Próximo diagnóstico |
| `<leader>dl` | Lista de diagnósticos |

---

## 🌿 Git

### Comandos Básicos

| Tecla | Descrição |
|-------|-----------|
| `<leader>gp` | Git pull |
| `<leader>gd` | Abrir diff view |
| `<leader>gc` | Fechar diff view |
| `<leader>gh` | Histórico do arquivo |

### Git Conflict (Resolução de Conflitos)

| Tecla | Descrição |
|-------|-----------|
| `co` | Escolher "ours" (nossa versão) |
| `ct` | Escolher "theirs" (versão deles) |
| `cb` | Escolher ambos |
| `c0` | Escolher nenhum |
| `]x` | Próximo conflito |
| `[x` | Conflito anterior |

---

## 💻 Terminal

| Tecla | Descrição |
|-------|-----------|
| `<leader>ft` | Abrir/fechar terminal flutuante |
| `Esc` | Sair do modo terminal |

---

## 🛠️ Ferramentas

### Which Key (Ajuda de Teclas)

| Tecla | Descrição |
|-------|-----------|
| `<leader>?` | Keymaps locais do buffer |
| `<leader>k` | Mostrar todos os keymaps |

### Twilight (Foco)

| Tecla | Descrição |
|-------|-----------|
| `<leader>tw` | Ativar/desativar Twilight |

> **Nota:** Twilight ativa automaticamente no modo Insert.

### Markdown Preview

| Tecla | Descrição |
|-------|-----------|
| `<leader>md` | Toggle preview do Markdown |

### Copilot

O GitHub Copilot funciona automaticamente ao digitar código. Use:

| Tecla | Descrição |
|-------|-----------|
| `Tab` | Aceitar sugestão |
| `Ctrl+]` | Dispensar sugestão |
| `Alt+]` | Próxima sugestão |
| `Alt+[` | Sugestão anterior |

---

## 📜 Comandos Ex

Comandos úteis para executar com `:` no modo normal:

### Gerenciamento de Plugins

| Comando | Descrição |
|---------|-----------|
| `:Lazy` | Abrir gerenciador de plugins |
| `:Lazy sync` | Atualizar todos os plugins |
| `:Lazy clean` | Remover plugins não usados |
| `:Lazy health` | Verificar saúde dos plugins |

### Mason (LSP/Formatters/Linters)

| Comando | Descrição |
|---------|-----------|
| `:Mason` | Abrir gerenciador Mason |
| `:MasonInstall <pkg>` | Instalar pacote |
| `:MasonUninstall <pkg>` | Desinstalar pacote |
| `:MasonUpdate` | Atualizar pacotes |

### Treesitter

| Comando | Descrição |
|---------|-----------|
| `:TSUpdate` | Atualizar parsers |
| `:TSInstall <lang>` | Instalar parser de linguagem |

### Diagnósticos

| Comando | Descrição |
|---------|-----------|
| `:LspInfo` | Informações do LSP |
| `:LspLog` | Log do LSP |
| `:checkhealth` | Verificar saúde do Neovim |

### Utilitários

| Comando | Descrição |
|---------|-----------|
| `:set number` | Mostrar números de linha |
| `:set relativenumber` | Números relativos |
| `:set wrap` | Quebrar linhas longas |
| `:noh` | Limpar destaque de busca |
| `:%s/old/new/g` | Substituir em todo arquivo |
| `:sort` | Ordenar linhas selecionadas |

---

## 🎨 Grupos de Teclas (Leader)

O prefixo `<leader>` (Espaço) organiza os comandos por categoria:

| Prefixo | Categoria |
|---------|-----------|
| `<leader>f` | Find/Files (Busca) |
| `<leader>g` | Git |
| `<leader>b` | Buffers |
| `<leader>l` | LSP |
| `<leader>t` | Toggle/Tools |
| `<leader>c` | Code |
| `<leader>d` | Diagnostics |
| `<leader>m` | Markdown |
| `<leader>v` | Vim/Config |

> **Dica:** Pressione `<leader>` e aguarde para ver todas as opções disponíveis com which-key!

---

## 🚀 Dicas Rápidas

1. **Use `:Telescope keymaps` para buscar qualquer atalho**
2. **Pressione `<leader>` e espere para ver opções**
3. **Use `:checkhealth` se algo não funcionar**
4. **Use `:Mason` para instalar/gerenciar LSPs**
5. **`K` mostra documentação em qualquer lugar**

---

