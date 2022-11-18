# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_not_overridden
class secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_not_overridden {
  $grub_config = @(GRUBCONTENT/L)
    if [ "x${grub_cfg}" != "x" ]; then
      chmod 400 ${grub_cfg}.new || true
    fi
    | GRUBCONTENT

  file { '/usr/sbin/grub-mkconfig':
    ensure  => file,
    content => $grub_config,
  }
}
