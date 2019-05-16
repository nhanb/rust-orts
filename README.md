# Dev

Target:

- Rust 1.34
- Nodejs 11.15
- Elm 0.19

Basically whatever is latest stable at the time of writing.

```sh
sudo pacman -S webkit2gtk
export npm_config_prefix=~/.node_modules
npm install -g elm elm-format
make run  # see Makefile for all possible targets
```
