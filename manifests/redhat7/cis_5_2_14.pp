# 5.2.14 Ensure SSH access is limited (Scored)
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
# @summary 5.2.14 Ensure SSH access is limited (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_14
class secure_linux_cis::redhat7::cis_5_2_14 (
  Boolean $enforced = true,
  Array[String] $allow_users = [],
  Array[String] $allow_groups = [],
  Array[String] $deny_users = [],
  Array[String] $deny_groups =[],
) {

  if $enforced {

    if $allow_users == [] and $allow_groups == [] and $deny_users == [] and $deny_groups == [] {

      notify { 'allow_groups':
        message  => 'Not in compliance with CIS 5.2.14 (Scored). One or more parameters in /etc/ssh/sshd_config have not been set.',
        loglevel => 'warning',
      }
    }
    else {

      if $allow_users != [] {

        $user_list_allow = join($allow_users, ' ')

        file_line{ 'ssh allow users':
          ensure => 'present',
          path   => '/etc/ssh/sshd_config',
          line   => "AllowUsers ${user_list_allow}",
          match  => '^#?AllowUsers',
        }

      }

      if $allow_groups != [] {

        $group_list_allow = join($allow_groups, ' ')

        file_line{ 'ssh allow groups':
          ensure => 'present',
          path   => '/etc/ssh/sshd_config',
          line   => "AllowGroups ${group_list_allow}",
          match  => '^#?AllowGroups',
        }

      }

      if $deny_users != [] {

        $user_list_deny = join($deny_users, ' ')

        file_line{ 'ssh deny users':
          ensure => 'present',
          path   => '/etc/ssh/sshd_config',
          line   => "DenyUsers ${user_list_deny}",
          match  => '^#?DenyUsers',
        }

      }

      if $deny_groups != [] {

        $group_list_deny = join($deny_groups, ' ')

        file_line{ 'ssh deny groups':
          ensure => 'present',
          path   => '/etc/ssh/sshd_config',
          line   => "DenyUsers ${group_list_deny}",
          match  => '^#?DenyUsers',
        }
      }
    }
  }
}
