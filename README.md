# zsh-pyenv-lazy
A zsh plugin for lazy loading of pyenv.
The initial `eval "$(pyenv init -)"` is executed the first time `pyenv` is called.

If `ZSH_PYENV_LAZY_VIRTUALENV` is set to `true`, also call `eval "$(pyenv virtualenv-init -)"`.

