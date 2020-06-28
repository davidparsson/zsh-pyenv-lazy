# zsh-pyenv-lazy

A zsh plugin for installing and lazy loading of pyenv.

`pyenv` will be installed if `$HOME/.pyenv` do not exist.

The initial `eval "$(pyenv init -)"` is executed the first time `pyenv` is called.

If `ZSH_PYENV_LAZY_VIRTUALENV` is set to `true`, also install `pyenv-virtualenv` and call `eval "$(pyenv virtualenv-init -)"`.

## Installation

### zgen

Update your `~/.zshrc` with the following line:

```sh
zgen load davidparsson/zsh-pyenv-lazy
```

### oh-my-zsh

```sh
git clone https://github.com/davidparsson/zsh-pyenv-lazy.git ~/.oh-my-zsh/custom/plugins/pyenv-lazy
```

Then, in your `~/.zshrc`, add `pyenv-lazy` to your `plugins` variable.

## N.B.

If your theme calls out to `pyenv` when constructing the prompt
(e.g. using the `pyenv` element in powerlevel9k),
pyenv will still be loaded immediately.

`
