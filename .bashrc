# .bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
 
export PATH=$PATH:$HOME/bin
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export PATH=/opt/local:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/anaconda/bin:$PATH
export PYTHONPATH=$HOME/anaconda/:$PYTHONPATH

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

if [ -d /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

if [ -x chef ]; then
  eval "$(chef shell-init bash)"
fi

# for groovy
if [ -d /usr/local/opt/groovy/libexec ]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
fi

set -o vi
