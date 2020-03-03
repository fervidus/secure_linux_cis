# @api private
#  Ensure SSH IgnoreRhosts is enabled (Scored)
#
# Description:
# The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or
# HostbasedAuthentication.
#
# Rationale:
# Setting this parameter forces users to enter a password when authenticating with ssh.
#
# @summary  Ensure SSH IgnoreRhosts is enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_ignorerhosts_is_enabled
class secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh ignore rhosts':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'IgnoreRhosts yes',
      match    => '^#?IgnoreRhosts',
      notify   => Exec['reload sshd'],
    }
  }
}
