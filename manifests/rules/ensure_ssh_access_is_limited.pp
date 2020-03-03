# @api private
# 4 Ensure SSH access is limited (Scored)
#
# Description:
# There are several options available to limit which users and group can access the system via SSH. It is recommended that at least one of
# the following options be leveraged:
#
# AllowUsers
# The AllowUsers variable gives the system administrator the option of allowing specific users to ssh into the system. The list consists of
# space separated user names. Numeric user IDs are not recognized with this variable. If a system administrator wants to restrict user
# access further by only allowing the allowed users to log in from a particular host, the entry can be specified in the form of user@host.
#
# AllowGroups
# The AllowGroups variable gives the system administrator the option of allowing specific groups of users to ssh into the system. The list
# consists of space separated group names. Numeric group IDs are not recognized with this variable.
#
# DenyUsers
# The DenyUsers variable gives the system administrator the option of denying specific users to ssh into the system. The list consists of
# space separated user names. Numeric user IDs are not recognized with this variable. If a system administrator wants to restrict user
# access further by specifically denying a user's access from a particular host, the entry can be specified in the form of user@host.
#
# DenyGroups
# The DenyGroups variable gives the system administrator the option of denying specific groups of users to ssh into the system. The list
# consists of space separated group names. Numeric group IDs are not recognized with this variable.
#
# Rationale:
# Restricting which users can remotely access the system via SSH will help ensure that only authorized users access the system.
#
# @summary 4 Ensure SSH access is limited (Scored)
#
# @param enforced Should this rule be enforced
# @param allow_users Which users to allow
# @param allow_groups Which groups to allow
# @param deny_users Which users to deny
# @param deny_groups Which groups to deny
#
# @example
#   include secure_linux_cis::ensure_ssh_access_is_limited
class secure_linux_cis::rules::ensure_ssh_access_is_limited(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    if $::secure_linux_cis::allow_users == [] and $::secure_linux_cis::allow_groups == [] and $::secure_linux_cis::deny_users == [] and
        $::secure_linux_cis::deny_groups == [] {
      notify { 'allow_groups':
        message  => 'Not in compliance with CIS 4 (Scored). One or more parameters in /etc/ssh/sshd_config have not been set.',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
    else {
      if $::secure_linux_cis::allow_users != [] {
        $user_list_allow = join($::secure_linux_cis::allow_users, ' ')
        file_line{ 'ssh allow users':
          ensure   => 'present',
          schedule => 'harden_schedule',
          path     => '/etc/ssh/sshd_config',
          line     => "AllowUsers ${user_list_allow}",
          match    => '^#?AllowUsers',
          notify   => Exec['reload sshd'],
        }
      }
      if $::secure_linux_cis::allow_groups != [] {
        $group_list_allow = join($::secure_linux_cis::allow_groups, ' ')
        file_line{ 'ssh allow groups':
          ensure   => 'present',
          schedule => 'harden_schedule',
          path     => '/etc/ssh/sshd_config',
          line     => "AllowGroups ${group_list_allow}",
          match    => '^#?AllowGroups',
          notify   => Exec['reload sshd'],
        }
      }
      if $::secure_linux_cis::deny_users != [] {
        $user_list_deny = join($::secure_linux_cis::deny_users, ' ')
        file_line{ 'ssh deny users':
          ensure   => 'present',
          schedule => 'harden_schedule',
          path     => '/etc/ssh/sshd_config',
          line     => "DenyUsers ${user_list_deny}",
          match    => '^#?DenyUsers',
          notify   => Exec['reload sshd'],
        }
      }
      if $::secure_linux_cis::deny_groups != [] {
        $group_list_deny = join($::secure_linux_cis::deny_groups, ' ')
        file_line{ 'ssh deny groups':
          ensure   => 'present',
          schedule => 'harden_schedule',
          path     => '/etc/ssh/sshd_config',
          line     => "DenyGroups ${group_list_deny}",
          match    => '^#?DenyGroups',
          notify   => Exec['reload sshd'],
        }
      }
    }
  }
}
