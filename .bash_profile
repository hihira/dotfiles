# .bash_profile

export PATH="$HOME/miniconda3/bin:$HOME/.nodebrew/current/bin:$HOME/bin:$HOME/local/bin:$HOME/.composer/vendor/bin:$PATH"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
if [ -f /usr/bin/byobu-launch ]; then
  _byobu_sourced=1 . /usr/bin/byobu-launch
fi
