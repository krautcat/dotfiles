__KRAUTCAT_ZSHENV=""

if [[ $__KRAUTCAT_ZSHENV != yes ]]; then
    PATH="${HOME}/.local/opt/tizen-studio/tools/:${PATH}"
    __KRAUTCAT_ZSHENV=yes
fi
