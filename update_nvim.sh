# FOLDER_NAME='nvim-linux64'
FOLDER_NAME='nvim-macos-arm64'

curl -s -L https://github.com/neovim/neovim/releases/latest/download/$FOLDER_NAME.tar.gz | tar xvz -C .

sudo rm -f /usr/bin/nvim
sudo mv $FOLDER_NAME/bin/nvim /usr/bin/nvim

sudo rm -rf /usr/lib/nvim
sudo mkdir /usr/lib/nvim
sudo mv $FOLDER_NAME/lib/nvim /usr/lib

sudo rm -rf /usr/share/nvim
sudo mkdir /usr/share/nvim
sudo mv $FOLDER_NAME/share/nvim /usr/share

rm -rf $FOLDER_NAME

sudo apt-get install xclip
