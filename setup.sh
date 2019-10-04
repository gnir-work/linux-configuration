set -x

echo "Configurating git."
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

echo "Installing vim..."
sudo apt-get install vim -y
ln -s ~/.linux-configuration/.vimrc ~/.vimrc
echo "Done"

echo "Installing curl"
sudo apt-get install curl -y
echo "Done"

echo "Installing zsh"
sudo apt-get install zsh -y
echo "Done"

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc ~

# Doing these will run zsh on terminal start (This is a patch but setting zsh to default shell doesn't work)
echo zsh >> ~/.bashrc
echo "Done"

echo "Creating basic home folder layout"
cd ~
mkdir Software
mkdir Code
cd -
echo "Done creating Software and Code folders"

# Changing language with alt + shift
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
