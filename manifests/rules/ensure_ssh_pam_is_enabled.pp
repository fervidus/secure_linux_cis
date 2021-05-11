# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ssh_pam_is_enabled
class secure_linux_cis::rules::ensure_ssh_pam_is_enabled {
    include secure_linux_cis::service
    file_line { 'pam enable':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => 'UsePam yes',
      match  => '^\s*UsePam\i',
      notify => Exec['reload sshd'],
    }
}
