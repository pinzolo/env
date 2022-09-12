#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit
compinit -u

autoload -Uz colors
colors

function git-current-branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color='46'
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color='226'
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color='09'
  else
    color='196'
  fi

  # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
  echo " %F{243}[%F{$color}$name%F{243}]"
}

# enable escape sequence (\e = )
setopt prompt_subst
PREVOK="%F{243}%%"
PREVOUT="%F{196}%%"
PROMPT=$'%F{45}%n%F{243}@%F{104}%m`git-current-branch` %(?,${PREVOK},${PREVOUT})%F{255} '
# for server
#PROMPT=$'%{\e[33m%}%n@%M %%%{\e[m%} '
# for root
#PROMPT=$'%{\e[31m%}%n@%M %#%{\e[m%} '
RPROMPT=$'%F{243}%/%{$reset_color%}'
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks  
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed
setopt ignoreeof
setopt no_flow_control

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey -e

if [ "$TERM" = "screen" ]; then
  preexec() {
    emulate -L zsh
    local -a cmd; cmd=(${(z)2})
    echo -n "\ek$cmd[1]:t\e\\"
  }

  precmd() { echo -n "\ek[`basename $PWD`]\e\\" }
fi

function chpwd() { ls }

# aliases
case "$OSTYPE" in
  darwin*)
    alias ls='ls -G'
    alias ll='ls -ahl -G'
    alias vi='nvim'
    alias vim='nvim'
    ;;
  linux*)
    alias ls='ls --color=auto'
    alias ll='ls -ahl --color=auto'
    ;;
esac
alias ps='ps axu'
alias mkdir='mkdir -p'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias cd='pushd'
alias bd='popd'
alias lv='lv -c'
alias reload='source ~/.zshrc'
alias clip_timestamp='date +"%Y%m%d%I%M%S" | tr -d '\''\n'\'' | pbcopy'
alias diff='colordiff -u'

export XDG_CONFIG_HOME=$HOME/.config # 設定ファイル置き場
export XDG_CACHE_HOME=$HOME/.cache # キャッシュとか重要でないデータ置き場
export XDG_DATA_HOME=$HOME/.local/share # データ置き場

export EDITOR=vim

export PATH="/usr/local/sbin:$PATH"

# rbenv
export PATH="$HOME/.anyenv/envs/rbenv/shims:$PATH"
# pyenv
export PATH="$HOME/.anyenv/envs/pyenv/shims:$PATH"
# ndenv
export PATH="$HOME/.anyenv/envs/ndenv/shims:$PATH"
# jenv
export PATH="$HOME/.anyenv/envs/jenv/shims:$PATH"

# peco
alias -g GB='`git branch | peco --prompt "GIT BRANCH>" | sed -e "s/^\*[ ]*//g"`'
alias -g GF='`git ls-files | peco --prompt "GIT FILES>"`'
alias -g GS='`git status --short | peco --prompt "GIT STATUS>" | awk '\''{print $2}'\''`'

alias -g GL='`git log --pretty=format:'\''%h - %s %ad <%an>%d'\'' --date=short | peco --prompt "GIT LOG>" | awk '\''{print $1}'\''`'
alias -g S='`ghq list --full-path | peco --prompt "SOURCE>" `'
alias -g SS='`ghq list --full-path pinzolo --prompt "SOURCE>" | peco`'
alias -g LS='`ls -a | peco --prompt "LS-A>" `'

# soruces (using ghq)
function peco-src() {
  local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^s' peco-src

# command history
function peco-history() {
  typeset tac
  if which tac > /dev/null; then
    tac=tac
  else
    tac='tail -r'
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | awk '!a[$0]++' | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N peco-history
bindkey '^r' peco-history
