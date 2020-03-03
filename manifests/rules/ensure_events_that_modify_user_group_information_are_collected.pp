# @api private
#  Ensure events that modify user/group information are collected (Scored)
#
# Description:
# Record events affecting the group , passwd (user IDs), shadow and gshadow (passwords) or
# /etc/security/opasswd (old passwords, based on remember parameter in the PAM
# configuration) files. The parameters in this section will watch the files to see if they have
# been opened for write or have had attribute changes (e.g. permissions) and tag them with
# the identifier "identity" in the audit log file.
#
# Rationale:
# Unexpected changes to these files could be an indication that the system has been
# compromised and that an unauthorized user is attempting to hide their activities or
# compromise additional accounts.
#
# @summary  Ensure events that modify user/group information are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_events_that_modify_user_group_information_are_collected
class secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected(
    Boolean $enforced = true,
) {

  Class['secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    file_line { 'audit.rules user/group 1':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/group -p wa -k identity',
    }
    file_line { 'audit.rules user/group 2':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/passwd -p wa -k identity',
    }
    file_line { 'audit.rules user/group 3':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/gshadow -p wa -k identity',
    }
    file_line { 'audit.rules user/group 4':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/shadow -p wa -k identity',
    }
    file_line { 'audit.rules user/group 5':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/security/opasswd -p wa -k identity',
    }
  }
}
