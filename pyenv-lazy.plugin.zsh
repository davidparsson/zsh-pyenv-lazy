# Lazy load pyenv
if type pyenv &> /dev/null; then
    local PYENV_SHIMS="${PYENV_ROOT:-${HOME}/.pyenv}/shims"
    export PATH="${PYENV_SHIMS}:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        pyenv $@
    }
fi
