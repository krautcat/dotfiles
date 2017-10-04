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
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
PATH="${PYENV_ROOT}/bin:${PATH}"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Completion
source $(pyenv root)/completions/pyenv.zsh
# ----------------------------------------- #

if [ -d "${HOME}/.cabal" ]; then
    # Haskell environment
    PATH="$HOME/.cabal/bin/:${PATH}"

    setopt SHARE_HISTORY             # Share history between all sessions.
    setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
    setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
    setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
    setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
    setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
    setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
    setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
    setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
    # ----------------------------------------- #
fi

# Aliases and user functions
source ${HOME}/.zsh_aliases

# Antigen
source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

export PATH
