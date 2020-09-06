# install zinit, a Zsh plugin manager
source ~/.zinit/bin/zinit.zsh

setopt prompt_subst

zinit wait lucid for \
        OMZL::git.zsh \
        OMZL::completion.zsh \
        OMZL::history.zsh \
        OMZL::theme-and-appearance.zsh \
  atload"unalias grv" \
        OMZP::git

PS1="READY >" # provide a simple prompt till the theme loads

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::gnzh
    #OMZT::robbyrussell
    #OMZT::gianu
    #OMZT::simple
    #OMZT::jreese
    #OMZT::agnoster

# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# 补全
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

#zinit snippet OMZP::vi-mode
#zinit snippet https://github.com/softmoth/zsh-vim-mode/blob/master/zsh-vim-mode.plugin.zsh
#zinit snippet OMZL::key-bindings.zsh

# 加载 pure 主题
#zinit ice pick"async.zsh" src"pure.zsh"
#zinit light sindresorhus/pure

#zinit ice mv="*.zsh -> _fzf" as="completion"
#zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
#zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'

zinit wait lucid for \
  atinit"zicompinit; zicdreplay"  \
        zdharma/fast-syntax-highlighting \
      OMZP::colored-man-pages \
      OMZP::autojump \
  as"completion" \
        OMZP::docker/_docker

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && source $(brew --prefix)/etc/profile.d/autojump.sh

# ======================= manually added below ==============================
[ -f ~/works/eagleshine/DevSetup/shell-scripts/utils.sh ] && \
    source ~/works/eagleshine/DevSetup/shell-scripts/utils.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#cd ~/works/vagrant/git-rainbow

# set fzf and fd
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export FZF_DEFAULT_OPTS='--bind="ctrl-w:toggle-preview,ctrl-o:execute(code {})+abort" --height=80% --preview="echo {}; cat {}" --preview-window=right:60%:wrap'
# ripgrep with fzf
export FZF_DEFAULT_COMMAND="rg --files || fd || find ."

#RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
#INITIAL_QUERY="foobar"
#FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
#  fzf --bind "change:reload:$RG_PREFIX {q} || true" \
#      --ansi --phony --query "$INITIAL_QUERY"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# modified from mitsuhiko dotfiles to use bat as a previewer
#alias skvi='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden)"; [[ $? -eq 0 ]] && vim "$x" || true }; f'
# doing the same for VSCode
#alias skvs='f(){ x="$(sk --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden)"; [[ $? -eq 0 ]] && code :w "$x" || true }; f'


export GO111MODULE=on

# history management
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt APPEND_HISTORY            # zsh sessions will append their history list to the history file, rather than replace it
#setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS  

export SSH_AUTH_SOCK=/Users/huibingy/.yubiagent/sock

#nvm
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

setopt vi
# move cursor to the beginning of line when use j/k in vi mode
# default moving to the end
# bindkey -M vicmd j vi-down-line-or-history
# bindkey -M vicmd k vi-up-line-or-history

# By default, ESC followed by / will search for a string matching what is currently on the command-line
# This causes ESC+/ to start searching as bash does
# bindkey -M main -r '^[/'

#bindkey '^j' autosuggest-fetch
bindkey '^j' autosuggest-fetch
bindkey '^k' autosuggest-accept
bindkey "^p" history-beginning-search-backward
bindkey "^n" history-beginning-search-forward
bindkey "^y" end-of-line-hist

unalias cat 2> /dev/null
unalias ls 2> /dev/null
alias ls="exa --group-directories-first"

export PATH="$PATH:/Users/huibingy/works/eagleshine/depot_tools"
eval "$(rbenv init -)"

