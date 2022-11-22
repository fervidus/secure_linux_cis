# @api private
#
# @summary Ensure mail transfer agent is configured for local-only mode 
#
class secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode {
  case $secure_linux_cis::mta {
    'postfix':
      {
        class { 'postfix':
          inet_interfaces => 'loopback-only',
        }
      }
      'exim', 'none', default: {
        unless $facts[ 'smtp_port' ].empty {
          notify { 'smtp':
            message  => 'Not in compliance with CIS 5 (Scored). There is a daemon listening on TCP port 25 (smtp). Check the smtp_port fact for details',#lint:ignore:140chars
            loglevel => 'warning',
          }
        }
      }
  }
}
