aur_get() {
    pkg=$1
    git clone https://aur.archlinux.org/${pkg}.git
    cd $pkg
}

aur_install() {
    makepkg -si
}
