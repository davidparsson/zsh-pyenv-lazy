# Lazy load pyenv
if type pyenv &> /dev/null; then
    export PATH="${HOME}/.pyenv/shims:${PATH}"
    function pyenv() {
        unset pyenv
        eval "$(command pyenv init -)"
        pyenv $@
    }
fi
