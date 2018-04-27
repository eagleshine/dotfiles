# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

if [ -d /usr/local/opt/openssl/bin ]; then
  export PATH="/usr/local/opt/openssl/bin:$PATH"
fi

if test "$SSH_AUTH_SOCK" ; then
   ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
