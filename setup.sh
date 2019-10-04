set -x

echo "Configurating git..."
git config --global user.email "gnir.work@gmail.com"
git config --global user.name "Nir Geller"
echo "Done"

echo "Installing tmux..."
sudo apt-get install tmux -y
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local
cd -
echo "Done"

echo "Installing the silver searcher"
sudo apt-get install silversearcher-ag -y
echo "Done"

echo "Installing curl"
sudo apt-get install curl -y
echo "Done"

echo "Installing pip"
curl https://bootstrap.pypa.io/get-pip.py -o ~/.linux-configuration/get-pip.py
python ~/.linux-configuration/get-pip.py
echo "Done"

echo "Installing basic pip packages"
pip install -r requirments.txt
ln -s ~/.linux-configuration/flake8 ~/.config/flake8
echo "Done"

echo "Installing vim..."
sudo apt-get install vim -y
ln -s ~/.linux-configuration/.vimrc ~/.vimrc
vim +PluginInstall +qall
echo "Done"

echo "Creating basic home folder layout"
mkdir ~/Software
mkdir ~/Code
mkdir ~/Movies
mkdir ~/Series
echo "Done creating Software and Code folders"

# Changing language with alt + shift
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"

echo "Installing zsh"
sudo apt-get install zsh -y
# Doing these will run zsh on terminal start (This is a patch but setting zsh to default shell doesn't work)
echo zsh >> ~/.bashrc
echo "Done"

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/.linux-configuration/.zshrc ~/.zshrc
echo "Done"
