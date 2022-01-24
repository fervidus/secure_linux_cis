# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ssh_protocol_is_not_set_to_1
class secure_linux_cis::rules::ensure_ssh_protocol_is_not_set_to_1 {
  include secure_linux_cis::sshd_service

  file_line { 'ssh protocol':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'Protocol 2',
    match  => '^Protocol.*',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
