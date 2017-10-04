# zsh env variables
HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
# -------------------------- #

PATH=${PATH}:${HOME}/.rvm/bin # Add RVM to PATH for scripting
PATH=${PATH}:${HOME}/x-tools/armv7-bbb-linux-gnueabihf/bin # Add cross-oolchain for Beaglebone Black
PATH=${PATH}:${HOME}/.local/share/umake/bin # Ubuntu make installation of Ubuntu Make binary symlink
PATH=${PATH}:${HOME}/bin:${HOME}/.local/bin # locaol bin paths
PATH=${PATH}:${HOME}/.cargo/bin # cargo
PATH=${PATH}:/opt/android-studio/bin                    # Android studio bin
PATH=${PATH}:/opt/pycharm-community-2017/bin            # PyCharm CE 2017 bin
export PATH

export GEM_HOME=$HOME/.gem
export GEM_PATH=$HOME/.gem

export TERM="xterm-256color"

export ARDMK_DIR="${HOME}/.local/share/Arduino-Makefile"
export ARDUINO_DIR="/opt/umake/ide/arduino"
export AVR_TOOLS_DIR="${HOME}/x-tools/avr-gcc-4.9/"
export AVRDUDE="/usr/bin/avrdude"
export AVRDUDE_CONF="/etc/avrdude.conf"

# Python environment
# pyenv and pyenv-virtualenv things
export PYENV_ROOT=${HOME}/.envs/pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source $(pyenv root)/completions/pyenv.zsh
# ----------------------------------------- #

# Aliases and user functions
source ${HOME}/.zsh_aliases

# Antigen
source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

