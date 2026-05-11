#!/bin/bash

echo "
███████╗██████╗ ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗
██╔════╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝
█████╗  ██████╔╝██║     ███████║██╔██╗ ██║██║  ███╗███████╗
██╔══╝  ██╔══██╗██║     ██╔══██║██║╚██╗██║██║   ██║╚════██║
███████╗██║  ██║███████╗██║  ██║██║ ╚████║╚██████╔╝███████║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
" | lolcat
echo "=== EBLAN OS ==="

# ЗОНА ОСНОВНОЙ УСТАНОВКИ #

echo "Устанавливаем EBLAN Browser..."
curl -sSL https://eblanbrowser.ru/install.sh | bash || echo "пиздец: браузер не установлен"

mkdir -p /home/liveuser/GovnoSoft
cp -r /etc/skel/GovnoSoft/* /home/liveuser/GovnoSoft/ 2>/dev/null || true
chown -R liveuser:liveuser /home/liveuser/GovnoSoft

cat > /home/liveuser/.config/hypr/welcome.sh << 'EOF'
#!/bin/bash
echo "Добро пожаловать в EBLAN OS, братан!"
EOF
chmod +x /home/liveuser/.config/hypr/welcome.sh

mkdir -p /home/liveuser/.config/hypr
cat > /home/liveuser/.config/hypr/autostart.conf << EOF
exec-once = bash ~/.config/hypr/welcome.sh
EOF

# ЗОНА ОСНОВНОЙ УСТАНОВКИ #

# ЗОНА ДОПОЛНИТЕЛЬНОЙ УСТАНОВКИ #

# зона спм пиздец #
echo "=== Пштановка SPM ==="
curl -sSL https://zenusus.sbs/dl/installSPM.sh | sudo bash
spm add https://codeberg.org/ribasyr/spm-repo/raw/branch/main/repo.json
spm add https://raw.githubusercontent.com/superisuer/spm-repository/refs/heads/main/repo.json
spm add http://eblanbrowser.ru/repo
echo "заебись"
# зона спм пиздец #

# зона вайбкода #
echo "=== Пштановка вайбкод залупы ==="
bash -c "$(curl -fsSL https://qwen-code-assets.oss-cn-hangzhou.aliyuncs.com/installation/install-qwen.sh)" -s --source qwenchat
curl -LsSf https://mistral.ai/vibe/install.sh | bash
curl -fsSL https://claude.ai/install.sh | bash
echo "заебись"
# зона вайбкода #

echo "=== Устанавливаем AUR пакеты ==="
pacman -S --needed --noconfirm base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

yay -S --noconfirm --needed \
    opera-gx \
    opera \
    google-chrome \
    google-chrome-beta \
    chromedriver \
    brave-origin-nightly-bin \
    microsoft-edge-stable-bin \
    yandex-browser \
    yandex-music \
    yandex-disk || echo "сука аллах чето не поставил совершаем харакири..."
yay -S --noconfirm --needed eblanfetch || echo "покойо"

# ЗОНА ДОПОЛНИТЕЛЬНОЙ УСТАНОВКИ #

echo "=== Настраиваем Calamares ==="

# Делаем так, чтобы Calamares запускался от liveuser с правами
mkdir -p airootfs/etc/skel/Desktop
cat > airootfs/etc/skel/Desktop/Install_EBLAN_OS.desktop << 'EOF'
[Desktop Entry]
Name=Установить EBLAN OS
Exec=calamares
Icon=system-software-install
Type=Application
Categories=System;
EOF

chmod +x airootfs/etc/skel/Desktop/Install_EBLAN_OS.desktop


echo "ъе"
