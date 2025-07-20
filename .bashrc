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
unset rc

export PATH="/home/rs0125/kumar:$PATH"

# Following line was automatically added by arttime installer
export MANPATH=/home/rs0125/.local/share/man:$MANPATH


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Kali-style prompt
PS1='\[\e[1;34m\]┌──(\[\e[1;32m\]\u\[\e[1;34m\]㉿\[\e[1;36m\]\h\[\e[1;34m\])-[\[\e[1;33m\]\w\[\e[1;34m\]]\n└─\[\e[1;31m\]\$\[\e[0m\] '

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
alias wallset="~/.config/wallset/wallset.sh"
