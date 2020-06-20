echo "fix zshrc link"
rm -f ~/.zshrc
ln -s ~/.linux-configuration/.zshrc ~/.zshrc
echo "done"

echo "Installing python versions"
pyenv install 3.6.10
pyenv install 3.8.3
echo "done"

echo "configuring black venv"
pyenv global 3.6.10
python -m venv ~/.vim_black
source ~/.vim_black/bin/activate
pip install black
deactivate
echo "done"


echo "Installing basic pip packages..."
pyenv global 3.8.3
pip install -r requirments.txt
ln -s ~/.linux-configuration/flake8 ~/.config/flake8
echo "Done"

