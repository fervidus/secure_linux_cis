# @api private
# 0 Ensure SSH PermitUserEnvironment is disabled (Scored)
#
# Description:
# The PermitUserEnvironment option allows users to present environment options to the ssh daemon.
#
# Rationale:
# Permitting users the ability to set environment variables through the SSH daemon could potentially allow users to bypass security
# controls (e.g. setting an execution path that has ssh executing trojan'd programs)
#
# @summary 0 Ensure SSH PermitUserEnvironment is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_permituserenvironment_is_disabled
class secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh permit user environment':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'PermitUserEnvironment no',
      match    => '^#?PermitUserEnvironment',
      multiple => true,
      notify   => Exec['reload sshd'],
    }
  }
}
