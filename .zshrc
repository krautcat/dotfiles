# Export alias file
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=9999
SAVEHIST=9999

export EDITOR=/usr/bin/vim

export KRAUTCAT_LOCAL="${HOME}/.local"
export KRAUTCAT_ENV_PATH="${HOME}/.local/env"
export KRAUTCAT_ENV_FILES="${HOME}/.envs"

PATH="${KRAUTCAT_LOCAL}/bin:${PATH}"

#-------- Perl ----
# plenv - Perl env manager
export PLENV_ROOT="${KRAUTCAT_ENV_FILES}/plenv"
PATH="${KRAUTCAT_ENV_PATH}/plenv/bin:${PATH}"      # for plenv

eval "$(plenv init - zsh)"

# Perl specific envvars
if [ -z "$PERL_MM_OPT" ]; then
    eval $(perl -I"${KRAUTCAT_LOCAL}/lib/perl5" -Mlocal::lib=/home/krautcat/.local | grep -v "PATH")
fi
#------------------

#-------- Python --
# pyenv - Python env manager
export PYENV_ROOT="${KRAUTCAT_ENV_FILES}/pyenv"
PATH="${KRAUTCAT_ENV_PATH}/pyenv/bin:${PATH}"

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# Python specific envvars
PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT
# source "${PYENV_ROOT}/completions/pyenv.zsh"
#------------

#-------- Ruby ----
export RBENV_ROOT="${KRAUTCAT_ENV_FILES}/rbenv"
PATH="${KRAUTCAT_ENV_PATH}/rbenv/bin:${PATH}"

eval "$(rbenv init - zsh)"

# Ruby specific envvars
GEM_SPEC_CACHE="${KRAUTCAT_LOCAL}/lib/ruby/specs"
PATH="${KRAUTCAT_LOCAL}/lib/ruby/bin:${PATH}"
export GEM_SPEC_CACHE
#------------------

# keychain 
# eval "$(keychain --eval --quiet t420_bitbucket_rsa t420_github_rsa personal-machines/corsair-obsidian-900d_rsa)"

export ARDUINO_DIR=/usr/share/java/Arduino-1.6.13
export ARDMK_DIR=${HOME}/.local/share/Arduino-Makefile 
export AVR_TOOLS_DIR=${HOME}/.arduino15/packages/arduino/tools/avr-gcc/4.9.2-atmel3.5.3-arduino2

export AVRDUDE=${HOME}/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino6/bin/avrdude
export AVRDUDE_CONF=${HOME}/.arduino15/packages/arduino/tools/avrdude/6.3.0-arduino6/etc/avrdude.conf
export BOARDS_TXT=/usr/share/java/Arduino-1.6.13/hardware/arduino/avr/boards.txt
export ARDUINO_VAR_PATH=/usr/share/java/Arduino-1.6.13/hardware/arduino/avr/variants
export BOOTLOADER_PARENT=/usr/share/java/Arduino-1.6.13/hardware/arduino/avr/bootloaders
export ARDUINO_CORE_PATH=/usr/share/java/Arduino-1.6.13/hardware/arduino/avr/cores/arduino

export PATH

source "${HOME}/.local/share/antigen/antigen.zsh"

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


