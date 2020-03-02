# @api private
# 5 Ensure mail transfer agent is configured for local-only mode (Scored)
#
# Description:
# Mail Transfer Agents (MTA), such as sendmail and Postfix, are used to listen for incoming mail and transfer
# the messages to the appropriate user or mail server. If the system is not intended to be a mail server,
# it is recommended that the MTA be configured to only process local mail.
#
# Rationale:
# The software for all Mail Transfer Agents is complex and most have a long history of security issues.
# While it is important to ensure that the system can process local mail messages,
# it is not necessary to have the MTA's daemon listening on a port unless the server
# is intended to be a mail server that receives and processes mail from other systems.
#
# @summary 5 Ensure mail transfer agent is configured for local-only mode (Scored)
#
# @param enforced Should this rule be enforced
# @param mta Which Mail Transfer program to use
#
# @example
#   include secure_linux_cis::ensure_mail_transfer_agent_is_configured_for_local_only_mode
class secure_linux_cis::rules::ensure_mail_transfer_agent_is_configured_for_local_only_mode(
    Boolean $enforced = true,
) {
  if $enforced {
    case $::secure_linux_cis::mta {
      'postfix':
        {
          class { '::postfix':
            inet_interfaces => 'loopback-only',
            schedule        => 'harden_schedule',
          }
        }
        'exim', 'none', default: {
          unless $facts[ 'smtp_port' ].empty {
            notify { 'smtp':
              message  => 'Not in compliance with CIS 5 (Scored). There is a daemon listening on TCP port 25 (smtp). Check the smtp_port fact for details',#lint:ignore:140chars
              schedule => 'harden_schedule',
              loglevel => 'warning',
            }
          }
        }
    }
  }
}
