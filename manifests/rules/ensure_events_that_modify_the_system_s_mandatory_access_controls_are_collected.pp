# @api private
#  Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
#
# Description:
# Monitor SELinux mandatory access controls. The parameters below monitor any write
# access (potential additional, deletion or modification of files in the directory) or attribute
# changes to the /etc/selinux or directory.
#
# Rationale:
# Changes to files in these directories could indicate that an unauthorized user is attempting
# to modify access controls and change security contexts, leading to a compromise of the
# system.
#
# @summary  Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected
class secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_events_that_modify_the_system_s_mandatory_access_controls_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    case $::secure_linux_cis::mac {
      'apparmor': {
        file_line { 'audit.rules apparmor 1':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/audit/rules.d/audit.rules',
          line     => '-w /etc/apparmor/ -p wa -k MAC-policy',
        }
        file_line { 'audit.rules apparmor 2':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/audit/rules.d/audit.rules',
          line     => '-w /etc/apparmor.d/ -p wa -k MAC-policy',
        }
      }
      'selinux', default: {
        file_line { 'audit.rules selinux 1':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/audit/rules.d/audit.rules',
          line     => '-w /etc/selinux/ -p wa -k MAC-policy',
        }
        file_line { 'audit.rules selinux 2':
          ensure   => present,
          schedule => 'harden_schedule',
          path     => '/etc/audit/rules.d/audit.rules',
          line     => '-w /usr/share/selinux/ -p wa -k MAC-policy',
        }
      }
    }
  }
}
