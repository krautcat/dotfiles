# Export alias file
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# zsh env variables
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=9999
SAVEHIST=9999

export EDITOR="/usr/bin/env vim"

KRAUTCAT_LOCAL="${HOME}/.local"
KRAUTCAT_ENV_PATH="${HOME}/.local/env"
KRAUTCAT_ENV_FILES="${HOME}/.envs"

# -------------------------- #

#-------- Perl
# plenv - Perl env manager
export PLENV_ROOT="${KRAUTCAT_ENV_FILES}/plenv"
PATH="${KRAUTCAT_ENV_PATH}/plenv/bin:${PATH}"      # for plenv

eval "$(plenv init - zsh)"

# Perl specific envvars
PERL_MB_OPT="--install_base ${KRAUTCAT_LOCAL}"
PERL_MM_OPT="INSTALL_BASE=${KRAUTCAT_LOCAL}"
export PERL_MB_OPT;
export PERL_MM_OPT;

#-------- Python
# pyenv - Python env manager
export PYENV_ROOT="${KRAUTCAT_ENV_FILES}/pyenv"
PATH="${KRAUTCAT_ENV_PATH}/pyenv/bin:${PATH}"

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# source "${PYENV_ROOT}/completions/pyenv.zsh"

#-------- Ruby
PATH="${HOME}/.rvm/bin:${PATH}" # Add RVM to PATH for scripting

# MISC!
export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

# ARDUINO (dunno)
export ARDMK_DIR="${HOME}/.local/share/Arduino-Makefile"
export ARDUINO_DIR="/opt/umake/ide/arduino"
export AVR_TOOLS_DIR="${HOME}/x-tools/avr-gcc-4.9/"
export AVRDUDE="/usr/bin/avrdude"
export AVRDUDE_CONF="/etc/avrdude.conf"
# ------------- #

PATH=${PATH}:${HOME}/x-tools/armv7-bbb-linux-gnueabihf/bin # Add cross-oolchain for Beaglebone Black
PATH=${PATH}:${HOME}/.local/share/umake/bin # Ubuntu make installation of Ubuntu Make binary symlink
PATH=${PATH}:${HOME}/bin:${HOME}/.local/bin # locaol bin paths
PATH=${PATH}:${HOME}/.cargo/bin # cargo
PATH=${PATH}:/opt/android-studio/bin                    # Android studio bin
PATH=${PATH}:/opt/pycharm-community-2017/bin            # PyCharm CE 2017 bin

export PATH

# Antigen
source "${HOME}/.local/share/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle lein

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

