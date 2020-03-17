# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_ssh_maxstartups_is_configured
class secure_linux_cis::rules::ensure_ssh_maxstartups_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh max startups':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "MaxStartups ${::secure_linux_cis::max_startups}",
      match    => '^#?MaxStartups',
      notify   => Exec['reload sshd'],
    }
  }
}
