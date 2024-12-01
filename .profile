# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export XDG_CONFIG_HOME=/home/krautcat/.config
export XDG_DATA_HOME=/home/krautcat/.local/share

export KRAUTCAT_LOCAL=/home/krautcat/.local
export KRAUTCAT_ENV_PATH=/home/krautcat/.local/env

export EDITOR="/usr/bin/env vim"

# set PATH so it includes user's private bin directories
PATH="$KRAUTCAT_LOCAL/bin:$PATH"          # User-site local bin paths.
export PATH="$KRAUTCAT_LOCAL/local/bin:${PATH}"    # My scripts.

