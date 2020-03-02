# @api private
# 4 Ensure SNMP Server is not enabled (Scored)
#
# Description:
# The Simple Network Management Protocol (SNMP) server is used to listen for SNMP commands from an SNMP management system,
# execute the commands or collect the information and then send results back to the requesting system.
#
# Rationale:
# The SNMP server can communicate using SNMP v1, which transmits data in the clear and does not require authentication to execute commands.
# Unless absolutely necessary, it is recommended that the SNMP service not be used.
# If SNMP is required the server should be configured to disallow SNMP v1.
#
# @summary 4 Ensure SNMP Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_snmp_server_is_not_enabled
class secure_linux_cis::rules::ensure_snmp_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'snmpd':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
