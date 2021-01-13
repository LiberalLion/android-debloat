/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask android-platform-tools bash qpdf git
sudo echo "/usr/local/bin/bash" >> /etc/shells
chsh -s /usr/local/bin/bash

cd ~
git clone https://github.com/gamerhat18/android-debloat/
cd android-debloat
bash debloat_script.sh
