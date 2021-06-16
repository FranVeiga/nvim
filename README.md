# FranVeiga - Neovim config

This is my personal neovim config.

## Install vim-plug

Run the following command:
```
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then run ```:PlugInstall``` to install plugins

## Coc extensions

First, you have to install ```nodejs``` and ```npm```.
On Arch Linux:
```
pacman -S nodejs npm
```

Then, to install extensions, run:
```
:CocInstall coc-python coc-json coc-vimlsp coc-snippets
```


