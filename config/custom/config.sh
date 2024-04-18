sudo rm -rf ~/Documents
sudo rm -rf ~/Downloads
ln -s ~/backup/Documents/ ~/Documents/
ln -s ~/backup/Downloads/ ~/Downloads/
rm ~/.gitconfig
ln -s ~/backup/config/.gitconfig ~/.gitconfig