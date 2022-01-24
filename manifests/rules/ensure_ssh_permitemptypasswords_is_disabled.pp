# @api private
#  Ensure SSH PermitEmptyPasswords is disabled (Scored)
#
# Description:
# The PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings.
#
# Rationale:
# Disallowing remote shell access to accounts that have an empty password reduces the probability of unauthorized access to the system
#
# @summary  Ensure SSH PermitEmptyPasswords is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_permitemptypasswords_is_disabled
class secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh permit empty password':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitEmptyPasswords no',
    match  => '^\s*PermitEmptyPasswords',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
