# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# Added by `rbenv init` on Thu May 23 01:35:42 PM PDT 2024
eval "$(rbenv init - bash)"
eval "$(~/.rbenv/bin/rbenv init -)"
. "$HOME/.cargo/env"
