#!/bin/bash
# =============================================
# EBLAN OS — Sway Edition customize.sh
# =============================================

echo "
███████╗██████╗ ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗
██╔════╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝
█████╗  ██████╔╝██║     ███████║██╔██╗ ██║██║  ███╗███████╗
██╔══╝  ██╔══██╗██║     ██╔══██║██║╚██╗██║██║   ██║╚════██║
███████╗██║  ██║███████╗██║  ██║██║ ╚████║╚██████╔╝███████║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
" | lolcat

echo "=== EBLAN OS пшановитель ==="

# ==================== BROWSER ====================
echo "[1/5] Устанавливаем EBLAN Browser..."
curl -sSL https://eblanbrowser.ru/install.sh | bash || echo "браузер не встал"

# ==================== SWAY ====================
echo "[2/5] Устанавливаем HALAL"

pacman -S --noconfirm \
    sway waybar wofi swaybg grim slurp \
    wl-clipboard pipewire wireplumber \
    pavucontrol kitty fastfetch \
    git curl base-devel

# ==================== CONFIGS ====================
echo "[3/5] установка залупы"
git clone https://github.com/yuerta/votv-sway-configs.git /tmp/votv-sway
mkdir -p /home/liveuser/.config
cp -r /tmp/votv-sway/sway /home/liveuser/.config/
cp -r /tmp/votv-sway/waybar /home/liveuser/.config/
cp -r /tmp/votv-sway/wofi /home/liveuser/.config/
cp -r /tmp/votv-sway/kitty /home/liveuser/.config/
cp -r /tmp/votv-sway/fastfetch /home/liveuser/.config/
cp /tmp/votv-sway/bashrc.txt /home/liveuser/.bashrc 2>/dev/null || true
chown -R liveuser:liveuser /home/liveuser/.config
rm -rf /tmp/votv-sway
echo "exec sway" > /home/liveuser/.bash_profile

# ==================== CALAMARES ====================
echo "[4/5] ставим ъе"

mkdir -p /home/liveuser/Desktop

cat > /home/liveuser/Desktop/Install_EBLAN_OS.desktop << 'EOF'
[Desktop Entry]
Name=Установить EBLAN OS
Comment=Погнали ставить систему
Exec=calamares
Icon=system-software-install
Type=Application
Categories=System;
EOF

chmod +x /home/liveuser/Desktop/Install_EBLAN_OS.desktop
chown liveuser:liveuser /home/liveuser/Desktop/Install_EBLAN_OS.desktop

# ==================== WELCOME ====================
echo "[5/5] Welcome message..."

cat > /home/liveuser/.config/sway/welcome.sh << 'EOF'
#!/bin/bash
clear
figlet "EBLAN OS" | lolcat
EOF

chmod +x /home/liveuser/.config/sway/welcome.sh

echo "exec-once = bash ~/.config/sway/welcome.sh" >> /home/liveuser/.config/sway/config 2>/dev/null || true

echo "=== ВСЁ ГОТОВО ==="
