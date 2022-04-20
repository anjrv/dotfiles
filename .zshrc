# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
# ZSH_THEME=""
# PS1='[\W]\$ '
PS4='[\W]\$ '
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

export LANG=en_US.UTF-8
export PAGER=less
export ZSH="/home/anjrv/.oh-my-zsh"

export TERM=xterm-256color
export TerminalEmulator=kitty
export BROWSER=/usr/bin/firefox
export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM=wayland

source $ZSH/oh-my-zsh.sh

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

IDF_PATH="$HOME/esp/esp-idf"
if [ -d "$IDF_PATH/tools" ];
  then PATH="$IDF_PATH/tools:$PATH"
fi

GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
if [ -d "$GEM_HOME/bin" ];
  then PATH="$GEM_HOME/bin:$PATH"
fi

# Sys update
alias update='yay && flatpak update && omz update'

# This thing is absurdly slow, only source when needed
alias nvm-init='source '/usr/share/nvm/init-nvm.sh''

alias sd='sudo shutdown -h now'
alias firmware='sudo systemctl reboot --firmware-setup'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ls='lsd -lh --group-dirs first'
alias la='lsd -lhA --group-dirs first'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias cat='bat'
alias grep='rg'
alias df='df -h'
alias wget="wget -c"
alias update-fc='sudo fc-cache -fv'
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#pacman related
alias pacman='sudo pacman --color auto'
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias orphans='pacman -Qdt'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#ctl errors
alias jctl="journalctl -p 3 -xb"

#stuff
alias v='nvim'
alias top='bpytop'
alias yt='ytfzf'
alias ytd='youtube-dl'
alias how='cht.sh'
alias pg='pgcli --less-chatty'
alias reload='kquitapp5 plasmashell && kstart5 plasmashell'
alias chrome-unsafe='google-chrome-stable --disable-web-security --user-data-dir="/home/anjrv/Projects/chrome_trash"'

#dotfiles
alias paclist='pacman -Qqen > ~/Documents/paclist.txt'
alias aurlist='pacman -Qqem > ~/Documents/aurlist.txt'

#ssh
alias ssh-krafla='ssh jaj20@krafla.rhi.hi.is'

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
