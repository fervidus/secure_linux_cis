# 1.4.1 Ensure permissions on bootloader config are configured (Scored)
#
#
# Description:
# The grub configuration file contains information on boot settings and passwords for unlocking boot options.
# The grub configuration is usually located at /boot/grub2/grub.cfg and linked as /etc/grub2.cfg. Additional settings can be found in the
# /boot/grub2/user.cfg file.
#
# @summary 1.4.1 Ensure permissions on bootloader config are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_4_1
class secure_linux_cis::redhat7::cis_1_4_1 (
  Boolean $enforced = true,
) {

  case $facts['os']['family'] {
    'RedHat': {
      $grubconfig = ['/boot/grub2/grub.cfg', '/boot/grub2/user.cfg']
    }
    'Debian': {
      $grubconfig = '/boot/grub/grub.cfg'
    }
    default: {
    }
  }

  if $enforced {

    file { $grubconfig:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }

  }
}
