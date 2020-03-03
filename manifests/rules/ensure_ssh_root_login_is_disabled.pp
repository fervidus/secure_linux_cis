# @api private
#  Ensure SSH root login is disabled (Scored)
#
# Description:
# The PermitRootLogin parameter specifies if the root user can log in using ssh(1). The default is no.
#
# Rationale:
# Disallowing root logins over SSH requires system admins to authenticate using their own individual account, then escalating to root via
# sudo or su . This in turn limits opportunity for non-repudiation and provides a clear audit trail in the event of a security incident
#
# @summary  Ensure SSH root login is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_root_login_is_disabled
class secure_linux_cis::rules::ensure_ssh_root_login_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh permit root login':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'PermitRootLogin no',
      match    => '^#?PermitRootLogin',
      notify   => Exec['reload sshd'],
    }
  }
}
