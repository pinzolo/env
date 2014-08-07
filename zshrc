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
    color=${fg[green]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${fg[yellow]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${fg_bold[red]}
  else
    color=${fg[red]}
  fi

  # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
  echo " [%{$color%}$name%{$reset_color%}]"
}

# enable escape sequence (\e = )
setopt prompt_subst
PROMPT=$'%{${fg[cyan]}%}%n@%m%{\e[m%}`git-current-branch` %{${fg[cyan]}%}%% '
# for server
#PROMPT=$'%{\e[33m%}%n@%M %%%{\e[m%} '
# for root
#PROMPT=$'%{\e[31m%}%n@%M %#%{\e[m%} '
RPROMPT=$'%{${fg[green]}%}[%/]%{\e[m%}'
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
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
    alias ll='ls -al -G'
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
    alias eclipse='/Applications/eclipse/eclipse "$@"'
    alias clipwd='pwd | pbcopy'
    ;;
  linux*)
    alias ls='ls --color=auto'
    alias ll='ls -al --color=auto'
    ;;
esac
alias ps='ps axu'
alias mkdir='mkdir -p'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias cd='pushd'
alias bd='popd'
alias lv='lv -c'
alias reload='source ~/.zshrc'
alias diff='colordiff'
alias clip_timestamp='date +"%Y%m%d%I%M%S" | pbcopy'

# functions
# 正規表現による一括置換を行う
function regrep() {
  for file in $*
  do
    if [ ${file} = $1 ]; then
      # do nothing
    elif [ ${file} = $2 ]; then
      # do nothing
    else
      cnt=`grep -c $1 ${file}`
      if [ ${cnt} -gt 0 ]; then
        result=`grep $1 ${file}`
        echo '-- '${file}
        echo ${result}
      fi
    fi
  done
  echo '上記ファイルを置換してよろしいですか？（'$1' -> '$2'）[y/n]'
  read answer
  if [ ${answer} = 'y' ]; then
    for file in $*
    do
      if [ ${file} = $1 ]; then
        # do nothing
      elif [ ${file} = $2 ]; then
        # do nothing
      else
        cnt=`grep -c $1 ${file}`
        if [ ${cnt} -gt 0 ]; then
          sed -i 's/'$1'/'$2'/g' ${file}
        fi
      fi
    done
  fi
}

# ファイル名検索(カレントディレクトリ基準)
function ff() {
  find . -name $1 -type f
}

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# bundler
export BUNDLER_EDITOR="vim +VimFiler"
alias be='bundle exec'
alias ber='bundle exec rails'
alias berk='bundle exec rake'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias berg='bundle exec rails generate'
alias berd='bundle exec rails destroy'

# homebrew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# golang
export GOPATH=$HOME
export PATH="$HOME/bin:$PATH"

# peco
alias -g GB='`git branch | peco | sed -e "s/^\*[ ]*//g"`'
alias -g GL='`git ls-files | peco`'
alias -g GS='`git status --short | peco | awk '\''{print $2}'\''`'
alias -g GH='`git log --oneline | peco | awk '\''{print $1}'\''`'
alias -g S='`ghq list --full-path | peco`'
alias -g SS='`ghq list --full-path pinzolo | peco`'
alias -g L='`ls -a | peco`'
alias o='open L'
alias gv='gvim L'
alias v='vim L'
alias l='ls -al | peco'

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
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N peco-history
bindkey '^r' peco-history

function plocate() {
  locate $@ | peco
}

# FIXME
function vlocate() {
  gvim $(plocate $@)
}
