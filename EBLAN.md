# 🚀 EBLAN OS — Полная Вики Говносборки 2026

**Самая молодёжная, токсичная и ебанутная Linux-сборка в истории.**

SIUUUU 🐧⚽

## Оглавление

- [1. Что такое EBLAN OS?](#1-что-такое-eblan-os)
- [2. Подготовка](#2-подготовка)
- [3. Структура проекта](#3-структура-проекта)
- [4. packages.x86_64](#4-packagesx86_64)
- [5. EBLAN Browser](#5-eblan-browser)
- [6. GovnoSoft (Python говнософт)](#6-govnosoft-python-говнософт)
- [7. Обои с Роналду](#7-обои-с-роналду)
- [8. customize.sh](#8-customizesh)
- [9. Hyprland Rice](#9-hyprland-rice)
- [10. Сборка ISO](#10-сборка-iso)
- [11. Промпты для ChatGPT](#11-промпты-для-chatgpt)

---

## 1. Что такое EBLAN OS?

Говносборка на базе Arch + Hyprland с:
- EBLAN Browser из коробки
- Кучей Python говнософта
- Обои только с Криштиану Роналду
- Максимальный молодёжный вайб 2026

**Цель:** Чтобы после установки сразу было весело и ебануто.

## 2. Подготовка

- [ ] Установить Arch Linux или Manjaro с Hyprland
- [ ] `sudo pacman -Syu archiso git base-devel`
- [ ] `cp -r /usr/share/archiso/configs/releng ~/eblan-os`
- [ ] `cd ~/eblan-os`

## 3. Структура проекта

```bash
~/eblan-os/
├── packages.x86_64
├── airootfs/
│   ├── root/
│   │   └── customize.sh
│   └── etc/skel/
│       ├── GovnoSoft/
│       ├── .config/hypr/
│       └── .local/share/wallpapers/
└── README.md
```

## 4. packages.x86_64

```txt
hyprland waybar kitty wofi swww dunst pipewire wireplumber pavucontrol
steam lutris wine-staging mangohud obs-studio
neovim fastfetch figlet cowsay lolcat
python python-rich python-colorama curl wget git
```

## 5. EBLAN Browser

В customize.sh:
```bash
echo "Устанавливаем EBLAN Browser..."
curl -sSL https://eblanbrowser.ru/install.sh | bash
```

## 6. GovnoSoft (Python говнософт)

Создай папку `airootfs/etc/skel/GovnoSoft/` и кидай туда скрипты.

## 7. Обои с Роналду

Положи картинки в `airootfs/etc/skel/.local/share/wallpapers/`

В hyprland.conf:
```conf
exec-once = swww img ~/.local/share/wallpapers/ronaldo-siu.jpg
```

## 11. Промпты для ChatGPT

**Eblo-Pinger**
```prompt
Ты токсичный русский питонист 2026 года. Напиши eblo-pinger.py...
```

**И так далее...**

**Готово к сборке?** `sudo mkarchiso -v .`

SIUUUU
