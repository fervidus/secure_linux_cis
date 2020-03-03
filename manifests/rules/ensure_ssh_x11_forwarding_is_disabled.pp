# @api private
#  Ensure SSH X11 forwarding is disabled (Scored)
#
# Description:
# The X11Forwarding parameter provides the ability to tunnel X11 traffic through
# the connection to enable remote graphic connections.
#
# Rationale:
# Disable X11 forwarding unless there is an operational requirement to use X11
# applications directly. There is a small risk that the remote X11 servers of
# users who are logged in via SSH with X11 forwarding could be compromised by
# other users on the X11 server. Note that even if X11 forwarding is disabled,
# users can always install their own forwarders.
#
# @summary  Ensure SSH X11 forwarding is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ssh_x11_forwarding_is_disabled
class secure_linux_cis::rules::ensure_ssh_x11_forwarding_is_disabled(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    file_line { 'ssh x11':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => 'X11Forwarding no',
      match    => '^#?[\r\n\f\v ]?X11Forwarding',
      notify   => Exec['reload sshd'],
    }
  }
}
