#!/usr/bin/env bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon

. "$HOME/.nix-profile/etc/profile.d/nix.sh"

command -v git >/dev/null 2>&1 || nix-env -iA nixpkgs.git

nix-env -iA \
  nixpkgs.nodejs \
  nixpkgs.nodePackages.npm \
  nixpkgs.go \
  nixpkgs.jdk \
  nixpkgs.rustup \
  nixpkgs.lua \
  nixpkgs.zsh \
  nixpkgs.neovim \
  nixpkgs.lsd \
  nixpkgs.bat \
  nixpkgs.tree \
  nixpkgs.jq \
  nixpkgs.ripgrep \
  nixpkgs.diff-so-fancy \
  nixpkgs.fzf \
  nixpkgs.btop \
  nixpkgs.ncdu \
  nixpkgs.lazygit \
  nixpkgs.shellcheck \
  nixpkgs.sumneko-lua-language-server \
  nixpkgs.stylua \
  nixpkgs.black \
  nixpkgs.nodePackages.prettier \
  nixpkgs.starship

rustup default stable

cd "$HOME/.config" || exit
git clone "https://github.com/anjrv/nvim.git" &&
  nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"

git clone "https://github.com/anjrv/zsh.git"

cd "$HOME" || exit
ln -s "$HOME/.config/zsh/.zshenv" ".zshenv"
command -v "$HOME/.nix-profile/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$HOME/.nix-profile/bin/zsh"

echo "Done with initial setup, restart session apply changes"
