# .bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export TERM=xterm
 
PATH=$PATH:$HOME/bin
export PATH

alias ls="ls -GF"
# export CLICOLOR=1
#
# for light terminal themes:
# export LSCOLORS=dxfxcxdxbxegedabagacad
export LSCOLORS=ExFxBxDxCxegedabagacad

# for dark terminal themes:
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced


alias ll="ls -l"
alias vi="vim"

# for black and white $PS1
if [ "x$YROOT_NAME" != "x" ]; then
    PS1="[\u@\h:$YROOT_NAME \W]\\$"
else
    PS1="[\u@\h \W]\\$ "
fi

# for colored $PS1
PS1="["
PS1="$PS1\[\e[36m\]\u\[\e[0m\]"
PS1="$PS1@"
PS1="$PS1\[\e[34;1m\]\h\[\e[0m\]"
if [ "x$YROOT_NAME" != "x" ]; then
        PS1="PS1:\[\e[32;40m\]$YROOT_NAME\[\e[0m\]"
        PS1="$PS1"
fi
PS1="$PS1 \w]"
PS1="$PS1\\$ "

#PS1="[\u@\h \W]\\$ "

export JAVA_HOME=$(/usr/libexec/java_home)

#export M2_HOME=/Users/huibingy/Downloads/apache-maven-3.2.1
#export PATH=/opt/local:/opt/local/bin:/opt/local/sbin:$PATH:$M2_HOME/bin
export PATH=/opt/local:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/Library/Python/3.6/bin:$PATH
#export PATH=$HOME/anaconda3/bin:$PATH
#export PYTHONPATH=$HOME/anaconda3/:$PYTHONPATH

set -o vi

eval "$(chef shell-init bash)"

#export DOCKER_HOST=tcp://192.168.59.105:2376
#export DOCKER_CERT_PATH=/Users/huibingy/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1

# for font config in gnuplot of octave
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# for groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# nvm in mac
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$PATH:$HOME/Downloads/Visual Studio Code 2.app/Contents/Resources/app/bin/"

# set fzf and fd
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

