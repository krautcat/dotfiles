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

# Python environment
export PYENV_ROOT=${HOME}/.envs/pyenv
export PATH=${PYENV_ROOT}/bin:${PATH}
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Completion
source $(pyenv root)/completions/pyenv.zsh

# Aliases and user functions
source ${HOME}/.zsh_aliases
# source ${HOME}/.zsh_funcs

# Antigen
source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme robbyrussell

antigen apply

