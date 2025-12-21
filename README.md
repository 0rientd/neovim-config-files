# 🚀 My Neovim IDE Config 🚀

A personalized Neovim setup that transforms your editor into a slick, modern IDE. Built on the speed of [LazyVim](https://www.lazyvim.org/).

### ✨ Features

*   ⚡️ **Fast & Lazy:** Managed with `lazy.nvim`.
*   🎨 **Pretty Themes:** Includes `everforest`, and more.
*   🧠 **Smart:** Full LSP support with `lsp-config`.
*   🌲 **File Explorer:** `neo-tree` for easy navigation.
*   🔍 **Fuzzy Finder:** `telescope.nvim` to find anything, anywhere.
*   🌈 **Better Syntax:** `treesitter` for beautiful and accurate highlighting.
*    स्टेटस **Cool Statusline:** `lualine` keeps you informed.

### 🐳 Test Drive with Docker

Want to try it out without messing with your local setup? Use the included Dockerfile!

1.  **Build the image:**
    ```bash
    docker build -t nvim-ide .
    ```

2.  **Run the container:**
    ```bash
    docker run -it --rm nvim-ide
    ```
    This will drop you into a `zsh` shell inside the container.

3.  **Launch Neovim:**
    ```bash
    nvim
    ```
    Plugins will install automatically on the first run.

> **❗️ Important Note:** The default `Dockerfile` clones the configuration from [this GitHub repo](https://github.com/0rientd/neovim-config-files.git). To test your **local changes**, you'll need to edit the `Dockerfile`.
>
> Comment out this line:
> ```dockerfile
> # RUN git clone https://github.com/0rientd/neovim-config-files.git $HOME/.config/nvim
> ```
>
> And add this line to copy your local files instead:
> ```dockerfile
> COPY . $HOME/.config/nvim
> ```