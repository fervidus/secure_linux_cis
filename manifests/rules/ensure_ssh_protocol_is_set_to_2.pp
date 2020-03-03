# @api private
#  Ensure SSH Protocol is set to 2 (Scored)
#
# Description:
# SSH supports two different and incompatible protocols: SSH1 and SSH2. SSH1 was
# the original protocol and was subject to security issues. SSH2 is more advanced
# and secure.
#
# Rationale:
# SSH v1 suffers from insecurities that do not affect SSH v2.
#
# @summary  Ensure SSH Protocol is set to 2 (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_protocol_is_set_to_2
class secure_linux_cis::rules::ensure_ssh_protocol_is_set_to_2(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh protocol':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'Protocol 2',
      match    => '^Protocol.*',
      notify   => Exec['reload sshd'],
    }
  }
}
