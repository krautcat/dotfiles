# Created by newuser for 5.2

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export TERM="xterm-256color"

export ARDMK_DIR="/usr/share/arduino"
export ARDUINO_DIR="/usr/share/arduino"
export AVR_TOOLS_DIR="$HOME/x-tools/avr-gcc-4.9/"
export AVRDUDE="/usr/bin/avrdude"
export AVRDUDE_CONF="/etc/avrdude.conf"

# Export alias file
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999

source /usr/share/zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

