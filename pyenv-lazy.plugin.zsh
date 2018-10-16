# Lazy load pyenv
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        pyenv $@
    }
fi
