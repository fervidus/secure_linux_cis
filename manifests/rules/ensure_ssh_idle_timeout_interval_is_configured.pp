# @api private
# 2 Ensure SSH Idle Timeout Interval is configured (Scored)
#
# Description:
# The two options ClientAliveInterval and ClientAliveCountMax control the timeout of ssh sessions. When the ClientAliveInterval variable is
# set, ssh sessions that have no activity for the specified length of time are terminated. When the ClientAliveCountMax variable is set,
# sshd will send client alive messages at every ClientAliveInterval interval. When the number of consecutive client alive messages are sent
# with no response from the client, the ssh session is terminated. For example, if the ClientAliveInterval is set to 15 seconds and the
# ClientAliveCountMax is set to 3, the client ssh session will be terminated after 45 seconds of idle time.
#
# Rationale:
# Having no timeout value associated with a connection could allow an unauthorized user access to another user's ssh session (e.g. user
# walks away from their computer and doesn't lock the screen). Setting a timeout value at least reduces the risk of this happening..
#
# While the recommended setting is 300 seconds (5 minutes), set this timeout value based on site policy. The recommended setting for
# ClientAliveCountMax is 0. In this case, the client session will be terminated after 5 minutes of idle time and no keepalive messages will
# be sent.
#
# @summary 2 Ensure SSH Idle Timeout Interval is configured (Scored)
#
# @param enforced Should this rule be enforced
# @param client_alive_interval Client alive interval to use
# @param client_alive_count_max Maximum specificed client alive count
#
# @example
#   include secure_linux_cis::ensure_ssh_idle_timeout_interval_is_configured
class secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    if $::secure_linux_cis::client_alive_interval > 300 or $::secure_linux_cis::client_alive_interval < 1 {
      fail('The Client Alive Interval has been manually set past the 1 - 300 threshold')
    }
    file_line { 'ssh alive interval':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "ClientAliveInterval ${::secure_linux_cis::client_alive_interval}",
      match    => '^#?ClientAliveInterval',
      notify   => Exec['reload sshd'],
    }
    file_line { 'ssh alive count max':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "ClientAliveCountMax ${::secure_linux_cis::client_alive_count_max}",
      match    => '^#?ClientAliveCountMax',
      notify   => Exec['reload sshd'],
    }
  }
}
