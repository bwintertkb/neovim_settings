git pull

rsync -aP --exclude={'*.bash', '*.git'} ./* ~/.config/nvim
