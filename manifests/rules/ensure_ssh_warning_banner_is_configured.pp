# @api private
# 5 Ensure SSH warning banner is configured (Scored)
#
# Description:
# The Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no
# banner is displayed.
#
# Rationale:
# Banners are used to warn connecting users of the particular site's policy regarding connection. Presenting a warning message prior to the
# normal user login may assist the prosecution of trespassers on the computer system.
#
# @summary 5 Ensure SSH warning banner is configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_warning_banner_is_configured
class secure_linux_cis::rules::ensure_ssh_warning_banner_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh warning banner':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'Banner /etc/issue.net',
      match    => '^#?Banner',
      notify   => Exec['reload sshd'],
    }
  }
}
