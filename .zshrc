if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

HISTFILE="${HOME}/.zsh_history"
HISTSIZE=9999
SAVEHIST=9999

export EDITOR=/usr/bin/vim

# My local environmetn variables
export KRAUTCAT_LOCAL="${HOME}/.local"
export KRAUTCAT_ENV_PATH="${HOME}/.local/env"
export KRAUTCAT_ENV_FILES="${HOME}/.envs"

fpath+="$KRAUTCAT_LOCAL/share/zsh/completion"

PATH="${KRAUTCAT_LOCAL}/bin:${PATH}"

export MANPATH="$KRAUTCAT_LOCAL/share/man:$MANPATH"
export TERMINFO="$KRAUTCAT_LOCAL/share/terminfo"

# Environment managers setup
# 
#
# ----------- Perl -------------
# plenv - Perl env manager
export PLENV_ROOT="${KRAUTCAT_ENV_FILES}/plenv"
export PLENV_HOOK_PATH="${KRAUTCAT_ENV_PATH}/plenv/plenv.d"
PATH="${KRAUTCAT_ENV_PATH}/plenv/bin:${PATH}"      # for plenv

eval "$(plenv init - zsh)"

# Perl specific env vars
if [ -z "$PERL_MM_OPT" ]; then
    eval $(perl -I"${KRAUTCAT_LOCAL}/lib/perl5" -Mlocal::lib=/home/krautcat/.local | grep -v "PATH")
fi
# ------------------------------

# ----------- Python -----------
# pyenv - Python env manager
export PYENV_ROOT="${KRAUTCAT_ENV_PATH}/pyenv"
PATH="${KRAUTCAT_ENV_PATH}/pyenv/bin:${PATH}"

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# Python specific env vars
PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT
source "${PYENV_ROOT}/completions/pyenv.zsh"
# ------------------------------

# ----------- Ruby -------------
# rbenv - Ruby env manager
export RBENV_ROOT="${KRAUTCAT_ENV_FILES}/rbenv"
PATH="${KRAUTCAT_ENV_PATH}/rbenv/bin:${PATH}"

eval "$(rbenv init - zsh)"

# Ruby specific env vars
GEM_SPEC_CACHE="${KRAUTCAT_LOCAL}/lib/ruby/specs"
PATH="${KRAUTCAT_LOCAL}/lib/ruby/bin:${PATH}"
export GEM_SPEC_CACHE
# ------------------------------

# ----------- OCaml ------------
export OPAMROOT="${KRAUTCAT_ENV_PATH}/opam"

source "${OPAMROOT}/opam-init/init.zsh"
# ------------------------------

# ----------- Rust -------------
export CARGO_HOME="$KRAUTCAT_ENV_PATH/rust/cargo"
export RUSTUP_HOME="$KRAUTCAT_ENV_PATH/rust/rustup"

PATH="$CARGO_HOME/bin:$PATH"
# ------------------------------

# keychain
# eval "$(keychain --eval --quiet t420_bitbucket_rsa t420_github_rsa personal-machines/corsair-obsidian-900d_rsa)"
export PATH


# Antigen's stuff
source "${HOME}/.local/share/antigen/antigen.zsh"

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme robbyrussell

antigen apply

