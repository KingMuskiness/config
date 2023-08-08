#!/bin/bash

# Ensure GRUB config is up to date
echo "Updating GRUB config file..."
grub-mkconfig -o /boot/grub/grub.cfg

# Make
grub-mkstandalone --pubkey "/boot/grub/MODULE_SIGNING_KEY" --directory "/usr/lib/grub/x86_64-efi" --format "x86_64-efi" --modules "pgp part_gpt fat ext2 configfile gcry_sha256 gcry_sha512 gcry_dsa gcry_rsa password_pbkdf2 normal linux all_video search search_fs_uuid reboot sleep loadenv minicmd test echo font" --disable-shim-lock --output "/boot/EFI/GRUB_EFI_FILE" "/boot/grub/grub.cfg=/etc/default/grub-signed.cfg" "/boot/grub/grub.cfg.sig=/etc/default/grub-signed.cfg.sig"

if (find /boot -type f -name "*.sig" -print0 | xargs -0 rm 2>/dev/null); then
   echo "Removing previous signatures... "
fi

for i in $(find /boot -type f -name "*.cfg" -or -name "*.lst" -or -name "*.mod" -or -name "grubenv" -or -name "*.mo" -or -name "*.pf2" -or -name "vmlinuz*" -or -name "initramfs*"); do
   if ! [ -e "$i".sig ]; then
   echo "Signing $i..."
   gpg --default-key "grub2_signing" --batch --detach-sign --pinentry-mode loopback --passphrase-fd 0 "$i" < /dev/shm/passphrase.txt
fi

sbsign --key /PATH/TO/db.key --cert /PATH/TO/db.crt -o "/boot/EFI/GRUB_EFI_FILE" "/boot/EFI/GRUB_EFI_FILE"

done

echo "Shredding passphrase file..."
shred -n 7 -v /dev/shm/passphrase.txt
