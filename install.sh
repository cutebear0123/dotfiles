set -e


echo "Checking for python 3.11, if exit before saying \"python 3.11 installed\" then you need to install python 3.11"
python -c "import sys; exit(sys.version_info.minor<11)"
echo "python 3.11 installed"
python -m pip 1> /dev/null

sudo dnf copr enable solopasha/hyprland -y
sudo dnf install -y hyprland hyprshot
sudo dnf copr enable leloubil/wl-clip-persist -y
sudo dnf install -y wl-clip-persist 
sudo dnf install kitty thunar firefox wofi wl-clipboard xdg-utils -y
sudo dnf install git golang -y

python -m pip install pyprland

cd /tmp/
git clone https://github.com/sentriz/cliphist
cd cliphist
go build
sudo mv cliphist /usr/bin/

echo "Done installing bloat!"

echo "moving config..."

cp wallpaper config/hypr -r
cp -r .config/* ~/.config/

echo "Configuring shell, if you want to use anything other then fish and starship, you have 5 sec to hit ctrl+c"
sleep 5
sudo dnf install fish -y
curl -sS https://starship.rs/install.sh | sh
echo "starship init fish | source" >> ~/.config/fish/config.fish
chsh -s $(which fish)
