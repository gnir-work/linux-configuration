# Exporting paths to $PATH variable
export PATH=$PATH:/home/nir/scripts

# Settings vim as default editor
export EDITOR=vim

# Configuring pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
