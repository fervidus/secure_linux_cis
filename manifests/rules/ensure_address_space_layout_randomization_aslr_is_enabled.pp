# @api private
#
# @summary Ensure address space layout randomization (ASLR) is   enabled 
#
class secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled {
  file { '/etc/sysctl.d/60-kernel_sysctl.conf':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/60-kernel_sysctl.conf',
  }
  -> exec { '/usr/sbin/sysctl -w kernel.randomize_va_space=2':
    refreshonly => true,
  }
}
