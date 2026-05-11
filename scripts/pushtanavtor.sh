#!/bin/bash
set -e

ROOT=$(pwd)
ISO_DIR="$ROOT/archiso"

mkdir -p "$ISO_DIR/airootfs/etc"
mkdir -p "$ISO_DIR/airootfs/home/liveuser/.config"
mkdir -p "$ISO_DIR/airootfs/usr/share/calamares/branding/eblan"
mkdir -p "$ISO_DIR/airootfs/usr/local/bin"
mkdir -p "$ISO_DIR/airootfs/root"

cp -r configs/sway "$ISO_DIR/airootfs/home/liveuser/.config/" 2>/dev/null || true
cp -r configs/waybar "$ISO_DIR/airootfs/home/liveuser/.config/" 2>/dev/null || true
cp -r branding/* "$ISO_DIR/airootfs/usr/share/calamares/branding/eblan/" 2>/dev/null || true

cp scripts/customize_airootfs.sh "$ISO_DIR/airootfs/root/customize_airootfs.sh"
chmod +x "$ISO_DIR/airootfs/root/customize_airootfs.sh"

if [ -f "$ISO_DIR/packages.x86_64" ]; then
    echo '[+] Используем существующий packages.x86_64'
else
    echo '[!] packages.x86_64 не найден'
fi

echo '[+] Repo разложен'
echo '[+] Теперь запускай:'
echo 'sudo mkarchiso -v archiso'
