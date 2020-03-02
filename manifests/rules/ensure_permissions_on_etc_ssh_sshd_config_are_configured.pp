# @api private
#  Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
#
# Description:
# The /etc/ssh/sshd_config file contains configuration specifications for sshd.
# The command below sets the owner and group of the file to root.
#
# Rationale:
# The /etc/ssh/sshd_config file needs to be protected from unauthorized changes
# by non-privileged users.
#
# @summary  Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_ssh_sshd_config_are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_ssh_sshd_config_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/etc/ssh/sshd_config':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0600',
    }
  }
}
