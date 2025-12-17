That's my custom Neovim configuration that turns your editor into a full-fledged IDE for modern development. It's built on top of the rock-solid foundation of LazyVim and comes with a curated set of plugins to boost your productivity.

## Features

*   **Plugin Management:** Uses the lightning-fast `lazy.nvim` plugin manager.
*   **Beautiful Themes:** Comes with a selection of popular themes like Catppuccin, Cyberdream, and Everforest.
*   **LSP:** Full-fledged Language Server Protocol (LSP) support for code intelligence.
*   **File Explorer:** A modern file explorer with `neo-tree`.
*   **Fuzzy Finder:** The powerful `telescope.nvim` for finding anything.
*   **Syntax Highlighting:** Enhanced syntax highlighting with `treesitter`.
*   **Statusline:** A beautiful and informative statusline with `lualine`.

## Plugins

This configuration includes the following plugins:

*   `catppuccin`
*   `cyberdream`
*   `everforest`
*   `lsp-config`
*   `lualine`
*   `neo-tree`
*   `telescope`
*   `treesitter`


## Custom Configurations

This project also includes custom configurations located in the `some-custom-configs/` directory. These are separate configurations that can be used as a reference or swapped out with the main configuration.

## Testing with Docker

This project includes a `Dockerfile` that allows you to build a containerized environment with Neovim and all the necessary dependencies.

### Build the Image

To build the Docker image, run the following command in the root of the project:

```bash
docker build -t nvim-ide .
```

### Run the Container

Once the image is built, you can run a container with the following command:

```bash
docker run -it --rm nvim-ide
```

This will drop you into a `bash` shell inside the container.

**Note:** The `Dockerfile` in this repository clones the Neovim configuration from [https://github.com/0rientd/neovim-config-files.git](https://github.com/0rientd/neovim-config-files.git). If you want to use the configuration from this repository, you will need to modify the `Dockerfile` to copy the local files instead.

## Usage

To start Neovim inside the container, simply run the following command:

```bash
nvim
```

The first time you run Neovim, the plugins will be installed automatically.
