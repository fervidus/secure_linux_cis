# @api private
#
# @summary Ensure permissions on bootloader config are not overridden 
#
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
