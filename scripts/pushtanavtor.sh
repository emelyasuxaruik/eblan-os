#!/bin/bash
set -e

ROOT=$(pwd)
ISO_DIR="$ROOT/archiso"

mkdir -p "$ISO_DIR/airootfs/etc"
mkdir -p "$ISO_DIR/airootfs/home/liveuser/.config"
mkdir -p "$ISO_DIR/airootfs/usr/share/calamares/branding/eblan"
mkdir -p "$ISO_DIR/airootfs/usr/local/bin"

cp -r configs/sway "$ISO_DIR/airootfs/home/liveuser/.config/" 2>/dev/null || true
cp -r configs/waybar "$ISO_DIR/airootfs/home/liveuser/.config/" 2>/dev/null || true
cp -r branding/* "$ISO_DIR/airootfs/usr/share/calamares/branding/eblan/" 2>/dev/null || true

cp scripts/customize_airootfs.sh "$ISO_DIR/airootfs/root/customize_airootfs.sh"
chmod +x "$ISO_DIR/airootfs/root/customize_airootfs.sh"

cat > "$ISO_DIR/packages.x86_64" << EOF
base
linux
linux-firmware
sway
waybar
wofi
kitty
fastfetch
networkmanager
pipewire
wireplumber
xorg-xwayland
calamares
polkit
curl
git
EOF

echo '[+] Repo разложен'
echo '[+] Теперь запускай:'
echo 'sudo mkarchiso -v archiso'
