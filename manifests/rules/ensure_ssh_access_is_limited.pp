# @api private
#
# @summary Ensure SSH access is limited 
#
class secure_linux_cis::rules::ensure_ssh_access_is_limited {
  include secure_linux_cis::sshd_service

  if $secure_linux_cis::allow_users == [] and $secure_linux_cis::allow_groups == [] and $secure_linux_cis::deny_users == [] and
  $secure_linux_cis::deny_groups == [] {
    notify { 'allow_groups':
      message  => 'Not in compliance with CIS 4 (Scored). One or more parameters in /etc/ssh/sshd_config have not been set.',
      loglevel => 'warning',
    }
  }
  else {
    if $secure_linux_cis::allow_users != [] {
      $user_list_allow = join($secure_linux_cis::allow_users, ' ')
      file_line { 'ssh allow users':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => "AllowUsers ${user_list_allow}",
        match  => '^#?AllowUsers',
        notify => Class['secure_linux_cis::sshd_service'],
      }
    }
    if $secure_linux_cis::allow_groups != [] {
      $group_list_allow = join($secure_linux_cis::allow_groups, ' ')
      file_line { 'ssh allow groups':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => "AllowGroups ${group_list_allow}",
        match  => '^#?AllowGroups',
        notify => Class['secure_linux_cis::sshd_service'],
      }
    }
    if $secure_linux_cis::deny_users != [] {
      $user_list_deny = join($secure_linux_cis::deny_users, ' ')
      file_line { 'ssh deny users':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => "DenyUsers ${user_list_deny}",
        match  => '^#?DenyUsers',
        notify => Class['secure_linux_cis::sshd_service'],
      }
    }
    if $secure_linux_cis::deny_groups != [] {
      $group_list_deny = join($secure_linux_cis::deny_groups, ' ')
      file_line { 'ssh deny groups':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => "DenyGroups ${group_list_deny}",
        match  => '^#?DenyGroups',
        notify => Class['secure_linux_cis::sshd_service'],
      }
    }
  }
}
