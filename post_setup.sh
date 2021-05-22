#!/bin/bash
set -x -e
BLACK_PYTHON=3.6.10
LATEST_PYTHON=3.9.5

echo "fix zshrc link"
rm -f ~/.zshrc
ln -s ~/.linux-configuration/.zshrc ~/.zshrc
echo "done"

echo "Installing python versions"
pyenv install $BLACK_PYTHON
pyenv install $LATEST_PYTHON
echo "done"

echo "configuring black venv"
pyenv global $BLACK_PYTHON
python -m venv ~/.vim_black
source ~/.vim_black/bin/activate
pip install black
deactivate
echo "done"

echo "Installing basic pip packages..."
pyenv global $LATEST_PYTHON
pip install -r requirments.txt
ln -s ~/.linux-configuration/flake8 ~/.config/flake8
echo "Done"

echo "Installing youcompleteme plugin..."
sudo apt install build-essential cmake vim-nox python3-dev -y
sudo apt install mono-complete golang nodejs default-jdk npm -y
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
echo "Done"

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Done"

echo "Configuring theme..."
bash -c  "$(wget -qO- https://git.io/vQgMr)"
echo "Done"
