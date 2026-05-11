#!/bin/bash
echo "=== EBLAN OS INSTALL ==="
echo "SIUUUU"

# EBLAN Browser
curl -sSL https://eblanbrowser.ru/install.sh | bash || true

mkdir -p /etc/skel/GovnoSoft
cp -r /root/GovnoSoft/* /etc/skel/GovnoSoft/ 2>/dev/null || true

chmod +x /etc/skel/GovnoSoft/*.py

echo "EBLAN OS установлен! SIUUUU"