
# for UEFI only we should avoid SElinux relabeling vfat filesystem: /boot/efi

# empty or 0 means using BIOS method
is_true $USING_UEFI_BOOTLOADER || return 0

cat > $TARGET_FS_ROOT/etc/selinux/fixfiles_exclude_dirs <<EOF
/boot/efi
/boot/efi(/.*)?
EOF

