# @api private
#
# @summary Ensure permissions on bootloader config are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_bootloader_config_are_configured {
  file { $secure_linux_cis::grub_config_files:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'og-rwx',
  }
}
