# .bashrc

### functions ###
# Get Linux distribution name
get_os_distribution() {
    if   [ -e /etc/debian_version ] ||
         [ -e /etc/debian_release ]; then
        # Check Ubuntu or Debian
        if [ -e /etc/lsb-release ]; then
            # Ubuntu
            distri_name="ubuntu"
        else
            # Debian
            distri_name="debian"
        fi
    elif [ -e /etc/fedora-release ]; then
        # Fedra
        distri_name="fedora"
    elif [ -e /etc/redhat-release ]; then
        # CentOS
        distri_name="redhat"
    elif [ -e /etc/turbolinux-release ]; then
        # Turbolinux
        distri_name="turbol"
    elif [ -e /etc/SuSE-release ]; then
        # SuSE Linux
        distri_name="suse"
    elif [ -e /etc/mandriva-release ]; then
        # Mandriva Linux
        distri_name="mandriva"
    elif [ -e /etc/vine-release ]; then
        # Vine Linux
        distri_name="vine"
    elif [ -e /etc/gentoo-release ]; then
        # Gentoo Linux
        distri_name="gentoo"
    else
        # Other
        echo "unkown distribution"
        distri_name="unkown"
    fi

    echo ${distri_name}
}

case "$-" in
  # 対話的実行の場合のみ実行
  *i*)

    # Source global definitions
    if [ -f /etc/bashrc ]; then
      . /etc/bashrc
      echo 'loaded /etc/bashrc'
    fi
    
    # User specific aliases and functions

    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    
    # git
    if [[ -f ~/.git-prompt.sh ]]; then
      . ~/.git-prompt.sh
      echo 'loaded ~/.git-prompt.sh'
    fi
    if [[ -f ~/.git-completion.bash ]]; then
      . ~/.git-completion.bash
      echo 'loaded ~/.git-completion.bash'
    fi
    
    # ssh
    if [[ -f ~/.bashrc_ssh ]]; then
      . ~/.bashrc_ssh
      echo 'loaded ~/.bashrc_ssh'
    fi
    
    PS1='[[33m\u[0m@[38;5;49m\H[0m [32m\w$(__git_ps1 " (%s)")[0m]\n\$ '
    
    export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"
    export LANG=ja_JP.UTF-8
    #export LC_CTYPE=C
    #export LC_ALL=C
    export LESSCHARSET=utf-8
    export LSCOLORS=gxfxcxdxbxegedabagacad
    
    ### 履歴 ###
    export HISTCONTROL=ignoredups
    export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '
    export HISTIGNORE="fg:bg:history*:cd*"
    # 入力履歴をログアウト時に保存する。
    export HISTFILE=~/.bash_history # 履歴をファイルに保存する
    export HISTSIZE=9999            # メモリ内の履歴の数
    export HISTFILESIZE=9999        # 保存される履歴の数
    # 端末間での共有
    export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
    shopt -u histappend             # 上記で.bash_historyに追記されるためシェルの追記機能をOFF
    
    # C-sによる画面停止の無効化
    stty stop undef
    
    # alias
    if [ -f "$HOME/.bashrc_alias_`uname`" ]; then
      . $HOME/.bashrc_alias_`uname`
      echo 'loaded ~/.bashrc_alias'
    fi
    
    # ssh で 今まで入ったことのあるホスト名を補完
    complete -W "$(sed 's/[ ,].*$/ /' ~/.ssh/known_hosts | tr -d '\n')" ssh
    
    ### 追加コマンド＆プラグイン ###
    # ack
    # BSD and Linux
    if ! ack --version > /dev/null; then
      if [ `uname` = 'FreeBSD' ]; then
        mkdir -p ~/bin
        curl http://beyondgrep.com/ack-1.96-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
      fi
      if [ `uname` = 'Linux' ]; then
        mkdir -p ~/bin
        curl http://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
      fi
    fi

    # jq
    if ! which jq > /dev/null; then
      if [ `uname` = 'Linux' ]; then
        mkdir -p ~/bin
        wget -O ~/bin/jq http://stedolan.github.io/jq/download/linux64/jq && chmod 0755 ~/bin/jq
      fi
    fi

    # bash completion
    if ! [ -f /etc/bash_completion ]; then
      if [ `uname` = 'Linux' ]; then
        distribution=`get_os_distribution`
        if [ $distribution = "redhat" ]; then
          wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm &&
          sudo rpm -ivh ./epel-release-6-8.noarch.rpm &&
          sudo yum install bash-completion
        fi
      fi
    fi
    
    # local settings
    if [ -f "$HOME/.bashrc_local" ]; then
      . $HOME/.bashrc_local
      echo 'loaded ~/.bashrc_local'
    fi
esac

#peco-select-history() {
#    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
#    READLINE_LINE="$l"
#    READLINE_POINT=${#l}
#}
#bind -x '"\C-r": peco-select-history'

[ -z "$PS1" ] && return

# enhancd
if [ -f "$HOME/.enhancd/bash/enhancd.bash" ]; then
    source "$HOME/.enhancd/bash/enhancd.bash"
fi
