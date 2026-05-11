#!/bin/bash

systemctl enable NetworkManager

useradd -m liveuser || true
passwd -d liveuser

mkdir -p /home/liveuser/Desktop

cat > /home/liveuser/Desktop/Install_EBLAN_OS.desktop << 'EOF'
[Desktop Entry]
Name=Install EBLAN OS
Exec=pkexec calamares
Icon=calamares
Type=Application
Categories=System;
EOF

chmod +x /home/liveuser/Desktop/Install_EBLAN_OS.desktop
chown -R liveuser:liveuser /home/liveuser

echo 'exec sway' > /home/liveuser/.bash_profile
