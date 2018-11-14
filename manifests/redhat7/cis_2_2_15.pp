# 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)
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
# @summary 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_15
class secure_linux_cis::redhat7::cis_2_2_15 (
  Boolean $enforced = true,
) {

  if $enforced {

    class { '::postfix':
      inet_interfaces => 'loopback-only',
    }
  }
}
