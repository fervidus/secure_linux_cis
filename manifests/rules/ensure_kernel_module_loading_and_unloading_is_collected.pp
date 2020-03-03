# @api private
# 7 Ensure kernel module loading and unloading is collected (Scored)
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
# @summary 7 Ensure kernel module loading and unloading is collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_kernel_module_loading_and_unloading_is_collected
class secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected(
    Boolean $enforced = true,
) {

  Class['::secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    # 64 bit architecture
    if $facts['os']['architecture'] =~ /64/ {
      file_line { 'audit.rules kernel module 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /sbin/insmod -p x -k modules',
      }
      file_line { 'audit.rules kernel module 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /sbin/rmmod -p x -k modules',
      }
      file_line { 'audit.rules kernel module 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /sbin/modprobe -p x -k modules',
      }
      file_line { 'audit.rules kernel module 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b64 -S init_module -S delete_module -k modules',
      }
      file_line { 'audit.rules kernel module 5':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
      }
    }
    # 32 bit architecture
    else {
      file_line { 'audit.rules kernel module 1':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /sbin/insmod -p x -k modules',
      }
      file_line { 'audit.rules kernel module 2':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /sbin/rmmod -p x -k modules',
      }
      file_line { 'audit.rules kernel module 3':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-w /sbin/modprobe -p x -k modules',
      }
      file_line { 'audit.rules kernel module 4':
        ensure   => present,
        schedule => 'harden_schedule',
        path     => '/etc/audit/rules.d/audit.rules',
        line     => '-a always,exit -F arch=b32 -S init_module -S delete_module -k modules',
      }
    }
  }
}
