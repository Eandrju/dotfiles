#!/bin/bash 

set -e

git clone --bare https://github.com/Eandrju/dotfiles $HOME/.dotfiles

function config {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

std_err_output=$(config checkout 2>&1 >/dev/null) || true

if [[ $std_err_output == *"following untracked working tree files would be overwritten"* ]]; then
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 |
        egrep "\s+\." |
        awk {'print $1'} |
        xargs -I% sh -c "mkdir -p '.dotfiles-backup/%';  mv % .dotfiles-backup/%"
fi;

config checkout
if [ $? == 0 ]; then
    echo "Successfully backed up conflicting dotfiles in .dotfiles-backup/. and imported dotfiles.";
else
    echo "Mission failed.";
fi;

config config status.showUntrackedFiles no
git config --global include.path "~/.gitconfig.aliases"

