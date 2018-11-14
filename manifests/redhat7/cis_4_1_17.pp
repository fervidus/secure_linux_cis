# 4.1.17 Ensure kernel module loading and unloading is collected (Scored)
#
# Description:
# Monitor the loading and unloading of kernel modules. The programs insmod (install a
# kernel module), rmmod (remove a kernel module), and modprobe (a more sophisticated
# program to load and unload modules, as well as some other features) control loading and
# unloading of modules. The init_module (load a module) and delete_module (delete a
# module) system calls control loading and unloading of modules. Any execution of the
# loading and unloading module programs and system calls will trigger an audit record with
# an identifier of "modules".
#
# Rationale:
# Monitoring the use of insmod , rmmod and modprobe could provide system administrators
# with evidence that an unauthorized user loaded or unloaded a kernel module, possibly
# compromising the security of the system. Monitoring of the init_module and
# delete_module system calls would reflect an unauthorized user attempting to use a
# different program to load and unload modules.
#
# @summary 4.1.17 Ensure kernel module loading and unloading is collected (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_17
class secure_linux_cis::redhat7::cis_4_1_17 (
  Boolean $enforced = true,
) {

  if $enforced {

    # 64 bit architecture
    if $facts['architecture'] =~ /64/ {

      file_line { 'audit.rules kernel module 1':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /sbin/insmod -p x -k modules',
      }

      file_line { 'audit.rules kernel module 2':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /sbin/rmmod -p x -k modules',
      }

      file_line { 'audit.rules kernel module 3':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /sbin/modprobe -p x -k modules',
      }

      file_line { 'audit.rules kernel module 4':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules',
      }
    }

    # 32 bit architecture
    else {

      file_line { 'audit.rules kernel module 1':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /sbin/insmod -p x -k modules',
      }

      file_line { 'audit.rules kernel module 2':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /sbin/rmmod -p x -k modules',
      }

      file_line { 'audit.rules kernel module 3':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-w /sbin/modprobe -p x -k modules',
      }

      file_line { 'audit.rules kernel module 4':
        ensure => present,
        path   => '/etc/audit/audit.rules',
        line   => '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
      }
    }
  }
}
