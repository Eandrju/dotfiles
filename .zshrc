OS="$(uname -s)"

#### Enable Powerlevel10k instant prompt ####
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#### End of Powerlevel10k instant prompt ####

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

# NVM
export NVM_LAZY_LOAD=true
#export NVM_COMPLETION=true
#export NVM_SYMLINK_CURRENT="true"
zinit wait='0a' lucid light-mode for lukechilds/zsh-nvm

# AUTOSUGGENSTIONS
zinit ice wait="0a" lucid atload="_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept

# COMPLETIONS
zinit ice wait="0c" lucid
zinit light zsh-users/zsh-completions
zinit ice wait="0c" lucid
zinit light greymd/docker-zsh-completion
fpath=(~/.config/completions $fpath)

# SYNTAX HIGHLIGHTING
zinit ice wait="!0c" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# HISTORY SEARCH
zinit ice wait="0b" lucid
zinit light zsh-users/zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# if [ "$OS" = "Darwin" ]; then
# elif [ "$OS" = "Linux" ]; then
# fi

# PROMPT THEME
zinit ice depth=1; zinit light romkatv/powerlevel10k
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.config/prompt/p10k.zsh

# HISTORY
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

