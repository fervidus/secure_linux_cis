# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ssh_maxsessions_is_set_to_4_or_less
class secure_linux_cis::rules::ensure_ssh_maxsessions_is_set_to_4_or_less {
    include secure_linux_cis::service

    file_line { 'ssh max sessions':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => "MaxSessions ${secure_linux_cis::max_sessions}",
      match  => '^\s*MaxSessions',
      notify => Exec['reload sshd'],
    }
}
