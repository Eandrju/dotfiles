## oh-my-zsh
#DISABLE_AUTO_UPDATE='true'
#COMPLETION_WAITING_DOTS='true'
#ZSH=~/.oh-my-zsh
#export ZSH_THEME=theunraveler
#plugins=(
#    nmap
#    sudo
#    themes
#    fast-syntax-highlighting
# )
#source $ZSH/oh-my-zsh.sh
#
## setup history

# ros initialize
#source /opt/ros/melodic/setup.zsh
#source ~/ros_projects/ros_omack_ws/devel/setup.zsh

# mbzirc init
#source ~/.mbzirc.sources.sh


OS="$(uname -s)"

# source exports, aliases
source ~/.aliases
source ~/.exports

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk


zinit light zdharma-continuum/zinit-annex-bin-gem-node
# AUTOSUGGENSTION
zinit light zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept
# COMPLETIONS
zinit light zsh-users/zsh-completions
# SYNTAX HIGHLIGHTING
zinit light zdharma-continuum/fast-syntax-highlighting

# EXA
zinit ice wait="2" lucid from="gh-r" as="null" mv="bin/exa* -> exa" sbin
zinit light ogham/exa
# PROMPT THEME
source ~/.prompt-theme.sh
# HISTORY
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

if [ "$OS" = "Darwin" ]; then
    bindkey '^[[A' history-search-backward
    bindkey '^[[B' history-search-forward
elif [ "$OS" = "Linux" ]; then
    # https://superuser.com/a/1296543
    # key dict is defined in /etc/zsh/zshrc
    bindkey "$key[Up]" history-search-backward
    bindkey "$key[Down]" history-search-forward
fi
#bindkey '\e[A' history-substring-search-up
#bindkey '\e[B' history-substring-search-down

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
zinit wait='1' lucid light-mode for lukechilds/zsh-nvm

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
