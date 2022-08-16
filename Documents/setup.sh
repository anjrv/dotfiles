#!/usr/bin/env bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon

. "$HOME/.nix-profile/etc/profile.d/nix.sh"

command -v git >/dev/null 2>&1 || nix-env -iA nixpkgs.git

nix-env -iA \
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
	nixpkgs.lldb \
	nixpkgs.sumneko-lua-language-server \
	nixpkgs.stylua \
	nixpkgs.starship

mkdir -p "$HOME/.local/share/fonts"
cd ~/.local/share/fonts &&
  curl -fLo "JetBrains Mono Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf &&
  fc-cache -f -v

cd "$HOME/.config" || exit
git clone "https://github.com/anjrv/nvim.git" && nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
git clone "https://github.com/anjrv/zsh.git"

cd "$HOME" || exit
ln -s "$HOME/.config/zsh/.zshenv" ".zshenv"
command -v zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"
