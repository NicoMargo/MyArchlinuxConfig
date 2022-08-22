#!/bin/bash

pacstrap -S base linux linux-firmware grub os-prober efibootmgr tar unrar unzip base-devel neovim nano networkmanager  wget thunar thunar-volman flameshot gvfs git archlinux-wallpaper bspwm sxhkd rofi sddm sudo htop materia-gtk-theme alacritty xorg ranger picom intel-ucode ntfs-3g papirus-icon-theme gnome-disk-utility neofetch rofi linux-headers gthumb gufw fuse2 gtkmm pcsclite libcanberra ncurses firefox tumbler filezilla pulseaudio pavucontrol pulseaudio-alsa alsa-utils --noconfirm &&
genfstab -U /mnt >> /mnt/etc/fstab &&
arch-chroot /mnt &&
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim &&
cd /opt &&
git clone https://aur.archlinux.org/yay.git &&
makepkg -si &&
yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
chsh -s /bin/zsh root &&
chsh -s /bin/zsh cacti &&
systemctl enable sddm NetworkManager &&
mkdir /boot/efi &&
grub-install --target=x86_64-efi --bootloader-id=Arch --efi-directory=/boot/efi &&
grub-mkconfig -o /boot/grub/grub.cfg
