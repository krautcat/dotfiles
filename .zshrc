# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=9999
SAVEHIST=9999
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/krautcat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH="${HOME}/.local/bin:${PATH}"   # User-site local bin paths

# Perl environment
export PLENV_ROOT="${HOME}/.envs/plenv"
PATH="${HOME}/.local/env/plenv/bin:${PATH}"

eval "$(plenv init - zsh)"
eval "$(perl -I"${HOME}/.local/lib/perl5" -Mlocal::lib="${HOME}/.local")"

# Python environment
export PYENV_ROOT=${HOME}/.envs/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
PATH="${HOME}/.local/env/pyenv/bin:${PATH}"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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


# Completion
source "${HOME}/.local/env/pyenv/completions/pyenv.zsh"

# Aliases and user functions
source ${HOME}/.zsh_aliases
source "${HOME}/.local/share/zsh-scripts/functions.zsh"

# Antigen
source "${HOME}/.local/share/zsh-antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

export PATH
