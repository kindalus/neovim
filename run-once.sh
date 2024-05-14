#!/bin/bash


DIR="/home/$USER"


rm -fr $DIR/.local/share/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	$DIR/.local/share/nvim/site/pack/packer/start/packer.nvim



mv ./after ./__after

nvim -u ./run-once.lua  -c "PackerSync"

mv ./__after ./after

echo "Done... Just open Neovim"
echo "Happy coding!!!"
