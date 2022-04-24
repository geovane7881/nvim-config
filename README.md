# GEOVANE7881 - NVIM-CONFIG

My Neovim Lua Configuration

---
## Dependencies

### Git

```
  sudo apt install git
```

### Node, nvm, npm

Install node v14.15.0 (latest lts) globally with nvm

[https://dxtright.com/index.php/2018/09/20/install-nvm-node-js-globally-linux-based-system/](https://dxtright.com/index.php/2018/09/20/install-nvm-node-js-globally-linux-based-system/)

### Python utilities

```
sudo apt install python3 python3-pip
sudo pip3 install pynvim

pip3 install --user neovim
```

### LiveGrep (for fuzzy finder like features)


```
  sudo get update && apt-get install build-essential
```

[https://github.com/BurntSushi/ripgrep#installation](https://github.com/BurntSushi/ripgrep#installation)

```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
$ sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

---
# Install and Usage of Neovim 0.5 +

### Install Paq

[https://github.com/savq/paq-nvim](https://github.com/savq/paq-nvim)

```
git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
```

### Clone this repository

```
mv ~/.config/nvim ~/.config/nvim_old
git clone https://github.com/geovane7881/nvim-config ~/.config/nvim

mv ~/.config/nvim ~/.config/nvim_old
```

***** @Important -- before open nvim you shoud comment colorscheme settings on:

```
~/.config/nvim/lua/settings.lua
```

### Install Latest release of Neovim

[https://github.com/neovim/neovim/releases](https://github.com/neovim/neovim/releases)

### Open Neovim and install plugins and language servers

```
:PaqInstall
:PaqSync

:LspInstall eslint
:LspInstall tsserver
:LspInstall angularls
:LspInstall html
:LspInstall cssls

:TSInstall javascript
:TSInstall typescript
:TSInstall json
:TSInstall html
:TSInstall css
```

---
## Language servers and plugins maybe need extra configuration

### Pretier, for coding formating

```
npm install -g --save-dev --save-exact prettier
```

### Telescope fzf

```
cd ~/.local/share/nvim/site/pack/paqs/start/telescope-fzf-native.nvim
make
```

### Lsp Language Servers

[https://github.com/neovim/nvim-lspconfig#tsserver](https://github.com/neovim/nvim-lspconfig#tsserver)

- Python

```
npm -i -g pyright
```

- HTML

```
npm i -g vscode-langservers-extracted
```

- Typescript

```
npm install -g --save-dev typescript typescript-language-server diagnostic-languageserver eslint_d
```

- Angular

```jsx
npm install -g --save-dev @angular/language-server
```

---

## Useful links

[Lua basic setup](https://dev.to/enrsaid)

[Lua step by step setup](https://medium.com/@tiagohs.dev/tudo-que-você-precisa-saber-para-configurar-o-neovim-usando-lua-c58df7b86e54)

