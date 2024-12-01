# Export alias file if [ -f ~/.zsh_aliases ]; then . ~/.zsh_aliases fi

# zsh env variables
HISTFILE="${ZDOTDIR:-HOME}/.zsh_history"
HISTSIZE=9999
SAVEHIST=9999

# My zsh completions.
KRAUTCAT_ZSH_COMP_PATH="$KRAUTCAT_LOCAL/share/zsh/functions/Completion"
KRAUTCAT_ZSH_KEYB_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/Keybindings"

fpath=(
    "$KRAUTCAT_ZSH_COMP_PATH/System"
    "$KRAUTCAT_ZSH_COMP_PATH/Local"
    "$KRAUTCAT_ZSH_COMP_PATH/User" 
    "${fpath[@]}"
)

zstyle ':compinstall' filename "${ZDOTDIR:-$HOME}/.zshrc"
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
#-----------------------

KRAUTCAT_ZSH_FUNCTIONS="$KRAUTCAT_LOCAL/share/zsh/functions"
KRAUTCAT_ZSH_COMP_PATH="$KRAUTCAT_ZSH_FUNCTIONS/Completion"

# -------------------------- #

#------------ Perl -------------
# plenv - Perl env manager
export PLENV_ROOT="${KRAUTCAT_ENV_PATH}/plenv"
PATH="${PLENV_ROOT}/bin:${PATH}"      # for plenv

eval "$(plenv init - zsh)"

# Perl specific envvars
# if [ -z "$PERL_MM_OPT" ]; then
#     eval $(perl -I"${KRAUTCAT_LOCAL}/lib/perl5" \
#                 -Mlocal::lib="${KRAUTCAT_LOCAL}")
# fi
#-------------------------------

#--------- Python --------------
# pyenv - Python env manager
export PYENV_ROOT="${KRAUTCAT_ENV_PATH}/pyenv"
PATH="${PYENV_ROOT}/bin:${PATH}"

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
source "${PYENV_ROOT}/completions/pyenv.zsh"

#--------- OCaml ---------------
export OPAMROOT="${KRAUTCAT_ENV_PATH}/opam"

source "${OPAMROOT}/opam-init/init.zsh"
#-------------------------------

# -------------------------------
# --- Node.js. ------------------
# -------------------------------
export NODENV_ROOT="$KRAUTCAT_ENV_PATH/nodenv"
PATH="$NODENV_ROOT/bin:$PATH"

eval "$(nodenv init - zsh)"

export npm_config_prefix="$KRAUTCAT_LOCAL"

export NODE_PATH="$KRAUTCAT_LOCAL/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
#-------------------------------

# -------------------------------
# --- Ruby. ---------------------
# -------------------------------
export RBENV_ROOT="$KRAUTCAT_ENV_PATH/rbenv"
PATH="$RBENV_ROOT/bin:$PATH"

eval "$(rbenv init - zsh)"

export GEM_HOME="$KRAUTCAT_LOCAL/lib/ruby/gems/$(ruby -e 'print RUBY_VERSION')"
export GEM_PATH="$GEM_HOME"
# -------------------------------

# ------------------------------------------------------------------------------
# --- Aurora OS. ---------------------------------------------------------------
# ------------------------------------------------------------------------------
export MER_ROOT='/home/krautcat/.local/opt/sdk/aurora/mer/4.0.1'
alias sfossdk-4.0.1="$MER_ROOT/sdks/sfossdk/mer-sdk-chroot"
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# --- Vim. ---------------------------------------------------------------------
# ------------------------------------------------------------------------------
export VIMINIT="source ~/.config/vim/vimrc"
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# --- GDB. ---------------------------------------------------------------------
# ------------------------------------------------------------------------------
export GDBHISTFILE="$XDG_DATA_HOME"/gdb/history
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# --- Rust ---------------------------------------------------------------------
# ------------------------------------------------------------------------------
export RUSTUP_HOME="$KRAUTCAT_LOCAL/env/rust/rustup"
export CARGO_HOME="$KRAUTCAT_LOCAL/env/rust/cargo"

PATH="$CARGO_HOME/bin:$PATH"
# ------------------------------------------------------------------------------


# ARDUINO (dunno)
export ARDMK_DIR="${HOME}/.local/share/Arduino-Makefile"
export ARDUINO_DIR="/opt/umake/ide/arduino"
export AVR_TOOLS_DIR="${HOME}/x-tools/avr-gcc-4.9/"
export AVRDUDE="/usr/bin/avrdude"
export AVRDUDE_CONF="/etc/avrdude.conf"
# ------------- #

PATH=${PATH}:${HOME}/x-tools/armv7-bbb-linux-gnueabihf/bin # Add cross-oolchain for Beaglebone Black
PATH=${PATH}:${HOME}/.local/share/umake/bin # Ubuntu make installation of Ubuntu Make binary symlink
PATH=${PATH}:/opt/android-studio/bin                    # Android studio bin
PATH=${PATH}:/opt/pycharm-community-2017/bin            # PyCharm CE 2017 bin

# Ubuntu make installation of Ubuntu Make binary symlink
PATH=/home/krautcat/.local/share/umake/bin:$PATH

source "$KRAUTCAT_ZSH_FUNCTIONS/User/functions.zsh"

export PATH

# Antigen
source "${HOME}/.local/share/antigen/antigen.zsh"

source "/usr/share/doc/fzf/examples/completion.zsh"
source "/usr/share/doc/fzf/examples/key-bindings.zsh"

# GPG and SSH agent
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

antigen use oh-my-zsh

antigen bundle git
antigen bundle docker
antigen bundle pip

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

