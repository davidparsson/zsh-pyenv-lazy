export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"

# Try to install pyenv, if $PYENV_ROOT is empty
function _zsh_pyenv_install() {
    echo "Installing pyenv..."
    if type brew > /dev/null; then
        brew install pyenv
    else
        git clone "https://github.com/pyenv/pyenv.git" "${PYENV_ROOT}"
    fi

    if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
        echo "Installing pyenv-virtualenv..."
        if type brew > /dev/null; then
            brew install pyenv-virtualenv
        else
            git clone "https://github.com/pyenv/pyenv-virtualenv.git" "${PYENV_ROOT}/plugins/pyenv-virtualenv"
        fi
    fi
}
[[ ! -e "${PYENV_ROOT}" ]] && _zsh_pyenv_install

# Try to find pyenv, if it's not on the path
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Lazy load pyenv
if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
fi
