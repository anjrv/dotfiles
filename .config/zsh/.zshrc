HISTFILE=$HOME/.config/zsh/zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt inc_append_history
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

unsetopt beep

autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -Uz colors && colors

source "$ZDOTDIR/zsh-functions"

ZVM_INIT_MODE='sourcing'

zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
# zsh_add_plugin "jeffreytse/zsh-vi-mode"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

eval "$(starship init zsh)"
