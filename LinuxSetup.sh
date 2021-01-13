if [ -f "/usr/bin/apt" ]
then
  sudo apt install android-sdk-platform-tools qpdf git
  cd ~
  git clone https://github.com/gamerhat18/android-debloat/
  cd android-debloat
  bash debloat_script.sh



if [ -f "/usr/bin/dnf" ]
then
  sudo dnf install android-sdk-platform-tools qpdf git
  cd ~
  git clone https://github.com/gamerhat18/android-debloat/
  cd android-debloat
  bash debloat_script.sh



if [ -f "/usr/bin/pacman" ]
then
  sudo pacman -S android-tools qpdf git
  cd ~
  git clone https://github.com/gamerhat18/android-debloat/
  cd android-debloat
  bash debloat_script.sh

EOF
