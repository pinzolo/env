autoload -U compinit
compinit

autoload -U colors
colors

# enable escape sequence (\e = )
setopt prompt_subst
PROMPT=$'%{\e[36m%}%n@%m %%%{\e[m%} '
# for server
#PROMPT=$'%{\e[33m%}%n@%M %%%{\e[m%} '
# for root
#PROMPT=$'%{\e[31m%}%n@%M %#%{\e[m%} '
RPROMPT=$'%{\e[32m%}[%/]%{\e[m%}'
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
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
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
alias be='bundle exec'
alias ber='bundle exec rails'
alias berk='bundle exec rake'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias berg='bundle exec rails generate'
alias berd='bundle exec rails destroy'

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

# for postgresql on mac OS X
case "$OSTYPE" in
  darwin*)
    export PATH="/usr/local/bin:$PATH"
    ;;
  linux*)
    ;;
esac
