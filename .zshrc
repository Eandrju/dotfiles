# source exports, aliases
source ~/.aliases
source ~/.exports

# oh-my-zsh
DISABLE_AUTO_UPDATE='true'
COMPLETION_WAITING_DOTS='true'
ZSH=~/.oh-my-zsh
ZSH_THEME=theunraveler
plugins=(git
         nmap
         python
         sudo
         themes
         zsh-dircolors-solarized
         torrent 
         vagrant 
         zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# bigger history
HISTSIZE=10000000
SAVEHIST=10000000

# conda initialize
source ~/anaconda3/etc/profile.d/conda.sh

# ros initialize
source /opt/ros/melodic/setup.zsh
source ~/ros_projects/ros_omack_ws/devel/setup.zsh
