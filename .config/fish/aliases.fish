# Basic
alias .. "cd .."
alias ... "cd ../.."

alias pronobot "cd $HOME/Documents/PRONOBOT"

alias ls "ls -Gla"
alias la "ls -Gla"
alias ld 'ls -l | grep "^d"'
alias ll 'ls -ahlF'

if type -q exa
  alias ll "exa -la -g --icons"
  alias ls "exa -la -g --icons"
  alias ld "exa -la -g --icons | grep '^d'"
end

#Apt
alias ai "sudo apt install"
alias au "sudo apt update"
alias ag "sudo apt upgrade"
alias ar "sudo apt remove"

# editor
alias v nvim
alias vi nvim
alias vim nvim

# git
alias g git
alias ga "git add"
alias gb "git branch"
alias gba "git branch -a"
alias gbd "git branch -D"
alias gcm "git commit -am"
alias gco "git checkout"
alias gcob "git checkout -b"
alias gcp "git cherry-pick"
alias gd "git diff"
alias gdc "git diff --cached"
alias gl "git lg"
alias gm "git merge --no-ff"
alias gp "git push"
alias gpo "git push --set-upstream origin main"
alias gpom "git pull origin master"
alias gpt "git push --tags"
alias grh "git reset --hard"
alias grs "git reset --soft"
alias gst "git status -sb --ignore-submodules"
alias undopush "git push -f origin HEAD^:master"

# docker / k8s
alias d "sudo docker"
alias ds "sudo docker start"
alias dcs "sudo docker container stop"
