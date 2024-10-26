eval "$(sheldon source)"

#alias ll='ls -alFG'
#export LSCOLORS=gxfxcxdxbxegedabagacad

alias ll='ls -alF --color'

### https://docs.brew.sh/Shell-Completion
### START
if type brew &>/dev/null
then
  PREFIX_BREW=$(brew --prefix)

  autoload -Uz compinit
  compinit

  if [ -d "${PREFIX_BREW}/opt/coreutils/libexec/gnubin" ]; then
    PATH="${PREFIX_BREW}/opt/coreutils/libexec/gnubin:$PATH"
    eval "$(dircolors)"
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  fi
fi
### END

### fzf
### START
if type fzf &>/dev/null
then
  source <(fzf --zsh)

  _fzf_compgen_path() {
    fd --color=always --hidden --follow --exclude ".git" . "$1"
  }

  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }

  export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
  export FZF_DEFAULT_OPTS='--ansi --bind ctrl-f:page-down,ctrl-b:page-up'

  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --color=always"
  export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'
    --color header:italic
    --header 'Press CTRL-/ to change preview window (down|hidden|). Press CTRL-F/B to move cursor page-down/up.'"

  export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND/--type f/--type d}"

  export FZF_CTRL_R_OPTS="
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard. Press CTRL-F/B to move cursor page-down/up.'"
fi
### END
