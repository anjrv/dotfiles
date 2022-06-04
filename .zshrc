export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

unsetopt beep

autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -Uz colors && colors

source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

eval "$(starship init zsh)"
