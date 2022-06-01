export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

setopt appendhistory
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

unsetopt beep

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz colors && colors

if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
else
export EDITOR='nvim'
fi

if [ -d "$HOME/.bin" ];
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ];
  then PATH="$HOME/.local/bin:$PATH"
fi

GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
if [ -d "$GEM_HOME/bin" ];
  then PATH="$GEM_HOME/bin:$PATH"
fi

# This thing is absurdly slow, only source when needed
alias nvm-init='source '/usr/share/nvm/init-nvm.sh''
alias conda-init='source '/home/anjrv/.local/share/anaconda3/conda-setup''

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ls='lsd -lh --group-dirs first'
alias la='lsd -lhA --group-dirs first'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias cat='bat'
alias top='btop'
alias grep='rg --color=auto'
alias df='df -h'
alias free='free -m'
alias v='nvim'
alias g='lazygit'
alias update='yay && flatpak update'
alias ytd='youtube-dl'
alias pg='pgcli --less-chatty'
alias reload='kquitapp5 plasmashell && kstart5 plasmashell'
alias chrome-unsafe='google-chrome-stable --disable-web-security --user-data-dir="/home/anjrv/Projects/chrome_trash"'

alias firmware='sudo systemctl reboot --firmware-setup'
alias update-fc='sudo fc-cache -fv'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

#pacman related
alias pacman='sudo pacman --color auto'
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias orphans='pacman -Qdt'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

#debugging
alias jctl="journalctl -p 3 -xb"
alias psmem='ps auxf | sort -nr -k 4 | head -5'
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

#dotfiles
alias paclist='pacman -Qqen > ~/Documents/paclist.txt'
alias aurlist='pacman -Qqem > ~/Documents/aurlist.txt'

#ssh
alias curr-ip='curl -4 icanhazip.com'
alias ssh='kitty +kitten ssh'
alias ssh-krafla='kitty +kitten ssh jaj20@krafla.rhi.hi.is'
alias ssh-pi-local='kitty +kitten ssh radikamari@192.168.1.6'
alias ssh-hv-local='kitty +kitten ssh edr@192.168.1.13'

#adb
alias adb-mirror='adb shell screenrecord --bit-rate=16m --output-format=h264 --size 800x600 - | ffplay -framerate 60 -framedrop -bufsize 16M -'

# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

eval "$(starship init zsh)"

