# @api private
#
# @summary Ensure kernel module loading and unloading is collected 
#
class secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected {
  Class['secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected']
  ~> Class['secure_linux_cis::reboot']
  # 64 bit architecture
  if $facts['os']['architecture'] =~ /64/ {
    file_line { 'audit.rules kernel module 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /sbin/insmod -p x -k modules',
    }
    file_line { 'audit.rules kernel module 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /sbin/rmmod -p x -k modules',
    }
    file_line { 'audit.rules kernel module 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /sbin/modprobe -p x -k modules',
    }
    file_line { 'audit.rules kernel module 4':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules',
    }
    file_line { 'audit.rules kernel module 5':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
    }
  }
  # 32 bit architecture
  else {
    file_line { 'audit.rules kernel module 1':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /sbin/insmod -p x -k modules',
    }
    file_line { 'audit.rules kernel module 2':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /sbin/rmmod -p x -k modules',
    }
    file_line { 'audit.rules kernel module 3':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-w /sbin/modprobe -p x -k modules',
    }
    file_line { 'audit.rules kernel module 4':
      ensure => present,
      path   => '/etc/audit/rules.d/audit.rules',
      line   => '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
    }
  }
}
