# @api private
#
# @summary Ensure AppArmor is enabled in the bootloader configuration 
#
class secure_linux_cis::rules::ensure_apparmor_is_enabled_in_the_bootloader_configuration {
  file_line { 'Ensure apparmor is enabled in bootloader':
    ensure => present,
    path   => '/boot/grub/grub',
    line   => 'GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"',
    match  => '^\s*GRUB_CMDLINE_LINUX\s*=',
  }
  ~> exec { 'refresh grub':
    command     => 'update-grub',
    refreshonly => true,
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
