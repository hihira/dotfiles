# .bash_profile

# screen settings
if [ -f ~/.bash_profile_screen ]; then
  . ~/.bash_profile_screen
fi

export PATH="$HOME/.nodebrew/current/bin:$HOME/bin:$HOME/local/bin:$HOME/.composer/vendor/bin:$PATH"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
if [ -f /usr/bin/byobu-launch ]; then
  _byobu_sourced=1 . /usr/bin/byobu-launch
fi

