# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
#
#system color scheme function, built in Bash on Fedora 39 GNOME true/0==dark, false/1==light
sys_color_scheme_is_dark() {
    #read system setting
    condition=$(gsettings get org.gnome.desktop.interface color-scheme)
    # Remove leading and trailing single quotes
    condition=$(echo "$condition" | tr -d "[:space:]'")
    if [ $condition == "prefer-dark" ]; then
        return 0
    else
        return 1
    fi
}

#ls -> lsd
alias ls='lsd --group-dirs=first'
alias lsa='lsd --all --group-dirs=first'
alias lstree='lsd --all --tree --depth=2 --group-dirs=first'
#
#cat -> bat but the theme based on color-scheme
bat_alias_wrapper() {
    #get color scheme
    sys_color_scheme_is_dark
    if [[ $? -eq 0 ]]; then
        # bat command with dark color scheme
        bat --theme=gruvbox-dark "$@"
    else
        # bat command with light color scheme
        bat --theme=gruvbox-light "$@"
    fi
}
alias cat='bat_alias_wrapper'

# User specific prompt
PS1='\[\e[92m\]\H\[\e[0m\]:\[\e[92m\]\w\[\e[0m\]\\$ '
# User specific environment variables
export PROMPT_DIRTRIM=1
export EDITOR=nvim

unset rc

# Shell Inits
#
. "$HOME/.cargo/env"
eval "$(~/.local/bin/mise activate bash)"
eval "$(~/.local/bin/mise activate bash)"
eval "$(~/.local/bin/mise activate bash)"
eval "$(~/.local/bin/mise activate bash)"
eval "$(~/.local/bin/mise activate bash)"
