#!/bin/bash

# EBLAN OS customize script

echo "
███████╗██████╗ ██╗      █████╗ ███╗   ██╗ ██████╗ ███████╗
██╔════╝██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝ ██╔════╝
█████╗  ██████╔╝██║     ███████║██╔██╗ ██║██║  ███╗███████╗
██╔══╝  ██╔══██╗██║     ██╔══██║██║╚██╗██║██║   ██║╚════██║
███████╗██║  ██║███████╗██║  ██║██║ ╚████║╚██████╔╝███████║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
" | lolcat

echo "=== EBLAN OS Customize Script ==="

# Установка EBLAN Browser
echo "Устанавливаем EBLAN Browser..."
curl -sSL https://eblanbrowser.ru/install.sh | bash || echo "EBLAN Browser не установлен, но похуй"

# Создаём GovnoSoft
mkdir -p /home/liveuser/GovnoSoft
cp -r /etc/skel/GovnoSoft/* /home/liveuser/GovnoSoft/ 2>/dev/null || true
chown -R liveuser:liveuser /home/liveuser/GovnoSoft

# Welcome скрипт
cat > /home/liveuser/.config/hypr/welcome.sh << 'EOF'
#!/bin/bash
echo "Добро пожаловать в EBLAN OS, братан!"
figlet "SIUUUU" | lolcat
echo "EBLAN Browser готов"
echo "GovnoSoft в ~/GovnoSoft"
EOF
chmod +x /home/liveuser/.config/hypr/welcome.sh

# Автозапуск welcome
mkdir -p /home/liveuser/.config/hypr
cat > /home/liveuser/.config/hypr/autostart.conf << EOF
exec-once = bash ~/.config/hypr/welcome.sh
EOF

echo "Customize завершён! SIUUUU"
